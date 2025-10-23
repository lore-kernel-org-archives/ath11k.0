Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8168CCD1BE
	for <ath11k@archiver.kernel.org>; Thu, 23 Oct 2025 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Srx4yT3LHdOkFspwOn/4G+W2+bIvoleolhCAPoGpUaI=; b=R6JWJ7s5ozZtTxWeIPerFPUrGl
	31xnTOnelwG1ErbAyUXdDyxxl7cOV616C3AcvyFwmN2iCyG51mzjcneNycfcrjtLwCBnyOrCFnS/n
	CrNeMcgE+s8n2NyiP+JEjqcjQdtzfqLqpM6+gyPgQYxsDA9xV1ASK0AuESpLtS5pW1dyZ9q8iLniV
	20tILVSoIg2QTAnmXtS46Om4D9/3CcOSOJ4TGkcOlCbkuEaBOl9Hkcpt8mXQZEoQrBa/iA3N+mkrE
	5/ixqHJTeLR5ZpyXT3dgZDatGq7nE3Ss2jIOAzVQCiXZ2vbr7LchMzeDEIfYWwitpH3N88vdxvICk
	mb9tLMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvur-00000006WAr-3hGm;
	Thu, 23 Oct 2025 14:03:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvuq-00000006WAV-1eJe
	for ath11k@bombadil.infradead.org;
	Thu, 23 Oct 2025 14:03:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Srx4yT3LHdOkFspwOn/4G+W2+bIvoleolhCAPoGpUaI=; b=bP0Omgu2c25sxkVEs+aypKucyd
	I13nmPqnzQVrbnz4HYDKP1eLS39ta8jcqTboYr4nx6SG1ulHnhdSD6M3V9ybiXUDMxgwE4+vxMBmr
	itmwnp7r7+Q76cH6quY+q0sH8nrehcd3ESLrY6JcNDpoDXuwD4bzLKEjeKczQkYbTKLD0tuIRgyYe
	5vffQW5CSjcZ9bujfUZjEvu2Jezh3iNahLWUmdTIDfymYUtoQuXibrZmlCYNnFdMbeq4+wnHNwr7w
	i7Npi7zUBG2ehwr9kOX7+DVAUSCSIqcbKy9/9FKA2OgBRJWUzaMdxT4mnSh8yqaybndoKIRRzkmMs
	JuDGSKKg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBv35-00000001O5b-3qNk
	for ath11k@lists.infradead.org;
	Thu, 23 Oct 2025 13:08:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6cC1i005645
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 14:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Srx4yT3LHdOkFspwOn/4G+W2+bIvoleolhCAPoGpUaI=; b=VSJjwT7dEF7jI4bX
	nun/gxBpYV6ETdySo40yH1qO6hTkUSOCHc2RdI3Wr1zSefGNpbSkLWw1GQv7WtPu
	Gjn1VU5Mvt0+ZrcoXeed15h8KpJ/uwnPMCMiXduTcnpwr/lZLepct4O3GhLhJQBG
	PP3jAUehrixB0TX5VYOvqfRVp8VBxSYmF0FqguLwrYKPjprpi9KescIRZeOzOac6
	CcLeyW8SrckQ3FgG0/Mwnk/L9EZ8esnFGqW6YP0h6F7uyH8JoMxerrFeQZWzXi+i
	rVHIelqVC4Apj945kQoYfeCUpK9Vx7mbCN18fRm+2mfXryqGUT2U+aeYhMZjm0Z7
	mNS7Xg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j8jek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 14:03:34 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce15aaa99so732654a12.0
        for <ath11k@lists.infradead.org>; Thu, 23 Oct 2025 07:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761228213; x=1761833013;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Srx4yT3LHdOkFspwOn/4G+W2+bIvoleolhCAPoGpUaI=;
        b=YzDXCutSWlW+3VhtNOIqh8vp1HIVM8mjaWJVJJ84r0I8PCy+fQmWGD1ADT89q1yWEe
         UK+8CSDDqnM8BtxPbZvSs/hQ53OPbrujGV5WJCacyuSgjrLhGar0Z7D9qL17P0Njmrh3
         F5g4ZHAGeBMKzHEw6eXHh00bZnyWjHQdQVAuOimo3L58+rQKjbDjEsXlUNLTUKYtTAT5
         cwEPqfWDTvDZ9E8HaUwpXKS+7T3dEVucaZF6sltZfq6qFcjE9gxea828Y2kIo+UF03/g
         KVi4RHb6E4zffU5Comxnqfzkvq/pSnqB1RCPMG519AFk58Z6TGdhhgpb0M6pHeS7fvm0
         BGLA==
X-Forwarded-Encrypted: i=1; AJvYcCXUV7fTH8VRp2sqSLkoRVrWor5lzCIjSugYb9gqNl1+d0aJ4i2/Umz4ishTYUxUk3FnCGlK7Z4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWTmk/Kr57av5Vf1uVKD6ZYQvQZeDv/79X7BnKWe9snyS63mIA
	VI9QXtL0tdMp30HbqOr/TWjzQQ7NMUZ5grEvjJVCM26fWj+7oBhRRnU1sbZxmspzTUDPk+ONeu8
	OSWmR+cCVEOktkUqrk+Kd2aR1GHJGdEKnKWapiKMRY21YjCg3HkmahKhHLgBIql97
X-Gm-Gg: ASbGncsL6GC+9jpL5D1Yn37Kw6yM1/gpH/tXcQObmztvsYXv+e4gCRy9lsV45no7x7A
	rSZ98BooFogN6Th1SxI+qfAsCqpAcW3fhIb+Zh3ErCQ57t+LQZmj2KoICeoeh94Fe3Jh0g4sktw
	qVqZzwMWg9KIa9HAvhtzobrLuw4kW3mvQb2UqivcvvMUQML4fs+gEzAuFs7ahn3R3UlQV4YqI1g
	ihFECTl4NWfLdlxMlirwXsjbYutk1BI+GGFypLkYhbLioi0plQWzNq7pL/VABe1DJN4tE8Z2OWi
	VnXzfVOzmFgfB6JNvyVIDwF5ODpby69jSTNlSTCe2Jymf0foLMcHZdBNyD2pJKirWX/PJRI91tj
	jZKbERo1YXxOPuiJMJeflU9iW2T7WhLsUMsA=
X-Received: by 2002:a05:6a20:7491:b0:301:26ad:9143 with SMTP id adf61e73a8af0-334a8536f59mr32200900637.20.1761228212775;
        Thu, 23 Oct 2025 07:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4uYRrWqPwiQpNmcD5jwY7nMjABixCJHrxwny3DTqmT7ssH+bXFvpVy2uBx/NdN05+D+Bomw==
X-Received: by 2002:a05:6a20:7491:b0:301:26ad:9143 with SMTP id adf61e73a8af0-334a8536f59mr32200731637.20.1761228211382;
        Thu, 23 Oct 2025 07:03:31 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff3c1f8csm4250708a91.4.2025.10.23.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:03:30 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
References: <20251017-ath11k-mcs-assignment-v1-0-da40825c1783@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: fix MCS assignment
Message-Id: <176122821047.3033388.4520099279763878669.b4-ty@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 07:03:30 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX4VY8+lqlgZgV
 EcNEqGP6adIOOv4HBTs4lNsWCbwJA5AukTAMA1DnuftPqCfqEBWrL9FATE/glHW5rc4Wsx8Rep7
 Nde0p8aS+qSqC8cQNDWWPcz/QubYc40+azps3lISCGYjKS7jJWXJK4L4S90kPYaG6YtXskQNW7I
 aTpqn47maEu5fInO2sGcQAySTQhoeYG+jHbxMHcfLXvNgUct6BkqvZG9HLlZHwVJMxtVvxTawHW
 F7L4L2dsipm8ZgrOtUsCmt4SGDbyKCQ8joAiLpQ4gSndnwqb4g6ByUw9IKfzcUdnxlcFsUVlRY+
 ed5YWdaD3hWbPsQLWx+ueLmGU28bneb0oKul4NV1pREA1/FyaYiE3s4SEhVenjVaLccDe46si1u
 HLT/rgbiIE08FWWrTYJiNYmelXKvmw==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa35b6 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_wWWunvOjmwCgP-UNE4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 3z3tjy-q-POCZVUhK4zkP4yNbqZNDWUw
X-Proofpoint-ORIG-GUID: 3z3tjy-q-POCZVUhK4zkP4yNbqZNDWUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_140813_167003_D140CF8C 
X-CRM114-Status: UNSURE (   6.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On Fri, 17 Oct 2025 09:48:58 +0800, Baochen Qiang wrote:
> VHT and HE MCS handling are wrong, fix them.
> 
> 

Applied, thanks!

[1/2] wifi: ath11k: fix VHT MCS assignment
      commit: 47d0cd6bccb4604192633cc8d29511e85d811fc0
[2/2] wifi: ath11k: fix peer HE MCS assignment
      commit: 4a013ca2d490c73c40588d62712ffaa432046a04

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


