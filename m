Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95946CD6E65
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dk2+hefe94O+p0bhIxq1q58iVSITjTtWcV4dDmn5XA=; b=uGQMpfJyvXcE4PEcg2Szrb06C0
	CkHaltWE5YUU7P/ooAixx4rmu5YntS3qkwRm5l6FokWKGQvRQg8YyJxGpOHsgBQxbl4uTPhHxnYNJ
	ofHVXHUQjk3R9xiSX6FdwoS2icVFQr9BX4XKHBeurxiUlCBP2at9ihuHXlS79CvPNyldHCoynZP4D
	ta1TL3zbAvTfjjFg4PheHOrjlDRlXYiWfDXoS8HkirDACM4QYoVxW1NbK7YbMilnZYKMdUdTn5wUy
	/gzn6t+TNA54KiY4iX/nVGk796jrx/JOHfsio5SJzGG8uPY1Iwk+kHRNUieXJTYzlWs1s/PnkpgVD
	zWNypEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU60B-0000000BWvn-2GLS;
	Mon, 01 Jun 2026 17:00:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU607-0000000BWuS-220Z
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 17:00:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651Ewu9E1257485
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 17:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5dk2+hefe94O+p0bhIxq1q58iVSITjTtWcV4dDmn5XA=; b=e9xurB/Rr1XHzdIm
	IC/uvZJfFW0pFtFb1/hN3si1ieMr6A/h1DO4tWOFFKjvj3AT2woJkS4rXG/iWAKv
	rIyiM0IVbn9pKVeCxRCFN1ILo99H0JAWFsyvBfD1al3Hf5D/Dmci0sQaAzuvYK86
	cz6191SSIhu1eKKiILOce6i7rgkjiaHgpZ6ltvuSFyIifym/3UMxqTeYvFboL1uA
	vqFCO6lDWCd4t0ybjM6adW7VZ2sl0EnAN5WDly3fRKRzlz0dP0jp4D7DZ3kqSgkF
	vCn6j3tDIdofohWbJpzZE6BikUb/51U7dy+IU1viawB5MGy5hUiRLMpOTo1hbry5
	E/WqUw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sst2v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 17:00:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13709ab38a8so10458176c88.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780333230; x=1780938030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dk2+hefe94O+p0bhIxq1q58iVSITjTtWcV4dDmn5XA=;
        b=R8OYHXk+TAG1h6WIKa6weSARkAVxJdyNWTj1mkiuwlPzrgZDv8FyUldl2XLR4JLGjY
         k9o34p2Eq4RG1MJviXZ2CJoWReimFEIbJwi57QlS5hJaH+iQtME64+6Y6T6jv8PQqZeB
         NZULehi2E3BfgiOgs6rxk3tAi+TFup/MdicJ/rSFR2CaoJo/0VFqFB+usPo5ki4j3n32
         KGEF1I5Fy3mzrBjrwYD2TDTdM+GYvwhIBFcO8QJAo2JYMi4cGPb3GpiOq+ufWzfZ+uYX
         PId6TBIrBOZUwdq3SKx91q5XSs7IIc6in4ry2jL0vOGg0CFekTJoTsuT4MNl5xoWty5F
         FTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780333230; x=1780938030;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5dk2+hefe94O+p0bhIxq1q58iVSITjTtWcV4dDmn5XA=;
        b=Xb06zEm+c8I25p4/l+vqfiMXctFOqonTc50YC11joP/NvuABirR7b7kMye3eVd8T2v
         TT0aHElEhqY1T2qM8UqNdT2jvO70WrhND/hyiwv3spb4U6gxkIONzo9aKML+zZ6SZaNf
         8rxRZfBMWL9v6VN5KdGbDnaxd9r38TWZLJl/DU+m/ksvY6EcNbRIIAbwmtsHnMRqqW/d
         L86azulJNB1xKSAs4iZ+2R81qrQ+B9dicH4dOuE2EBe0fRWS3wjGW1OQRe1saTXoWQgE
         ODgu8t9gK+gydQM0Ac/aBdLNJI1WPVfCx8nxfou4afk6pRGFy1uDXoE/EaC09wsYChfd
         wjEQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DkVKImkGnVVQ4ACcJYI2H8txcoVxpGYRN+G4ghe08I2JZSYq7wSiwYSsjW4u+mUAVrLaMx3A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8EMTToE7140kIW5C+VAsimbvav//OeCX+QQyn8FTNwIayRY6v
	SQRqocpc23QfY8JwRKXxoNnllnF53EV1S3sHgPBXKxG+RX7u8XUus9nJZhoele1XzN4fbDOJs/l
	B8KJLGSqiTRZbLDUV0MlMB6ZwWEwF5A51xz85InRq1DUoVI/AOa4xeoVV60FwOTzr+uVL9nd1
X-Gm-Gg: Acq92OHIrCrS0lTnF7VDr4w5ELNGR/DHc+wyFFT4et9nCbuP8tBL9SmmZAp20Dh0gcF
	/RviZK2rQQ3gWXuvZ2P1DQkDEes4VvN2168HbeBjLELbCZeuhQQkE4O2Ae9gvmSVy1wpE/PPxo/
	9DyJI92TO2hwghQpm5F70ImrNxN/s023qPW729EpfG3wmb5b0XLit+iJ8sjS9ovE1uqaBSB2/tE
	bbaO20HQrpRH7x/eMUEgItfF1yehReeGfsVWQMr6Pj+R3/e4SswtkadflBcKOck5omj+IWXllaI
	1OKc5yPlJIh1mrOr4aw/emWDKer/QZnW/H63SU9NvLkAShN+8HwL3uhCvNT3rV17xC0N/v9Y4zS
	CRHXG6MfX7iCVQum5ivw6Pmq2MOSdhDptKDO6Q7NM+URGwupX4rLqI+9ON5UgAIOkJePbEBcen8
	3XWopdNz43ZMc=
X-Received: by 2002:a05:7022:ec88:b0:132:5d96:3e48 with SMTP id a92af1059eb24-137d42beeb9mr4823624c88.38.1780333230051;
        Mon, 01 Jun 2026 10:00:30 -0700 (PDT)
X-Received: by 2002:a05:7022:ec88:b0:132:5d96:3e48 with SMTP id a92af1059eb24-137d42beeb9mr4823602c88.38.1780333229302;
        Mon, 01 Jun 2026 10:00:29 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137b3c69bdfsm7151625c88.9.2026.06.01.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 10:00:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: linux-wireless@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20260428205017.26288-1-rosenp@gmail.com>
References: <20260428205017.26288-1-rosenp@gmail.com>
Subject: Re: [PATCHv3 ath-next] wifi: ath11k: use kzalloc_flex
Message-Id: <178033322855.2045173.15165164858522474928.b4-ty@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 10:00:28 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: L5ArLCPA8BYAKnGpGNJnmvg9hzBY18-y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE2OCBTYWx0ZWRfXyjchdubtd2mn
 LGZpWDXfO2y9xPQXCVgapm1jk2SzWEJslbgD92SSh1Q/XQpLaQhtKv5VodnfsQfbbUo99BtaQ5o
 TB3y2RbuoFoPtqswB5E95vml6gUilGfqOIdamZ0EfsBNwbEhBkXhD+UJQmpOdlVgozYQZcT2ulA
 AhUGiJ49Hh0ln/aOM2V/mZcgyaEWuJCMragWval+C+chayZs345A1jSHSQkhrHwRHtjymaJDTAi
 BOcOMuq1Zvwghf+R2bDEMaEJME2yIj737e4ZW04q4BXk1vr2Xvw5wetpf5FXSz4BidTgbyyq8mg
 2/7bryjvjCSEjJmHInM/1HOyKtTfiT8cJ/xdNG//87nj5Q1LIuI7NgoThY9lR6qnfQT5JeRraTz
 VN3HVMAfosjux7UHmWRD+IxubxLS0gCd8LqHKCLCUQRYEsRjZma83yrid4BTTRRWG0K9DJMPQE/
 1X5pHuwmwgKVJd8A72Q==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1dbaae cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rJ_IYOnZYG8bJ-BjWygA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: L5ArLCPA8BYAKnGpGNJnmvg9hzBY18-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_100031_529587_DFF67183 
X-CRM114-Status: UNSURE (   8.01  )
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


On Tue, 28 Apr 2026 13:50:17 -0700, Rosen Penev wrote:
> Convert kzalloc_obj + kcalloc to kzalloc_flex to save an allocation.
> 
> Add __counted_by to get extra runtime analysis. Move counting variable
> assignment immediately after allocation before any potential accesses.
> kzalloc_flex does this anyway for GCC >= 15.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: use kzalloc_flex
      commit: c7427f297ddb01f593217c21b2416f1093b80194

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


