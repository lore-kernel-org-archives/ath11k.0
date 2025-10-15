Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B854CCD195
	for <ath11k@archiver.kernel.org>; Wed, 15 Oct 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bt/ThjvpEY1Ds7Ra1mVzUh5C7dXWUsidS+33VW6u8/Q=; b=BmT5mU2H56u4RmjnzjTEEsTKRH
	8su0ofUhbiBY6AO9gcb5qO7dBLMQEkBksvAReIJfa9XrVIMsVcj6A5NOQrJOMaVTZ0UjgpW1dRAG+
	oNE/DcXdIT9l5cDBiMPHh8aPGmwto+PsSoz3MAZk72Xe2qIu1uyhoRabj1jVa9ihAtj6Yn3H98Pe4
	9m2he4UF4SS0a8LIKvpiVLvYDrhWroOOAlasH4Y1kS04JakN53oJ1jf90hREz6ZcezSKvLRiZ0oME
	fDg7b/9flD0wq8Ozm0N6bHTQ9+MGaxReNsrgug3FEr/lhkmlEdisP/zAouYVqdCnUSVGYfnMIHESc
	CNs6StAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6e-000000035hi-2ZF4;
	Wed, 15 Oct 2025 23:40:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9B6c-000000035g4-3H0p
	for ath11k@lists.infradead.org;
	Wed, 15 Oct 2025 23:40:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FJWDeQ016719
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bt/ThjvpEY1Ds7Ra1mVzUh5C7dXWUsidS+33VW6u8/Q=; b=oJ8myXQ/EXDF/HEO
	qcJosEWRIB7THof4wEpKpXpvcv71jWTQB41NyQ6n5nerbTheA5P2ILvuXYlRrc9x
	f+Gbe1jaAJU1JhI8PhrwCdIv7i3HBFGVllnWtLuBp2MYUtSnd/v4Piof1dsXQ7nR
	P6NmVDGqqsjydqRaPoFM1TUfZvICb3T7sZfdgt03jkw3neXomMP5O8Sdednstg+B
	p1phtivHa1N1ymjsulYeD4fc4sFyyFpo5KyEX3IVbqsAP6xvyhzIndSGYX6B46Ca
	VhM4TIvXjt/5vn6zAmr+t1KA+inIQ6kaXMrPUeyK31apMN9bqyX7N/hgi8bTwMAD
	T6aGpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtb7gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 23:40:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2681623f927so1286515ad.0
        for <ath11k@lists.infradead.org>; Wed, 15 Oct 2025 16:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760571628; x=1761176428;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bt/ThjvpEY1Ds7Ra1mVzUh5C7dXWUsidS+33VW6u8/Q=;
        b=uaFaBYs9XWc9jRa34q0VoVpASNO+qnWshy91dR7pz9dvHR3zDq9YvoYsuz+jLfjquA
         JfT2/KjR9p/vRMz18F5du4MHZ7sY7GO0C79y2y4aQEtZt6DcQYvkKq3Yd8AnJ16e/DpL
         le2Qk1iIrzAkEuVM1iwXi1NavpJOyw0UnGFpCel2mF3bQPDjZbXjLGvqSWT0LaV2INDz
         vLjP2ZMAiVWshFn0iiEURZJS4+Quw31dAt/3h46AWTx2R0DsiTnjMMybstoFLrd3aNlZ
         F41VJ7lYa5whXBsLYHxC8igR2GBmeqaFaWz8TIHWi+vOzz3xE4hnnSrRANXWeFx8Luk2
         XSGw==
X-Forwarded-Encrypted: i=1; AJvYcCUku5Lv+SwI1yy75spaiYUuEwbQ/q471zM03bxH0zFR3Xsb0G9ETIwtPDqiYUnk2jORu/jV6yk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyamoOsiFcaR6IgHe+xBEjhmJLgmR6nz5duR0JNQTUoKg+NivPo
	8bEJwpA/hXebeffgwzTIGFAw6lK6GunaerQlM7/RnwcbWhtJYhtKyT7UxMuSyT/+iefxoNkgmkj
	OEWYpKNW7QzN4YgpEW9YMGndQLDPadTC097jmYu9NY5ALhucCfrfalhqjJp0aCP69pnubzv5H
X-Gm-Gg: ASbGncuSc5H/unYYIDBiKpEV4/fTpsRPb8N3qSu8wH6Hi9qldVuKKcLu2T+f6ESN1ir
	kBaT4Vakt27bEBqBwnJ8ps3ydjbwFB8wrIkMQces5+c/ULMJjtpKD3elrnmgtN5jkKOvTZCN0ob
	nrZWbGNQ4tlrZqLLFVHHh3APXf0NLrwuOUiR3HUGq2ZupWeiWcxSB+Ny6iIIgpqaTkuUk5VCpB8
	/KnEd6E8by9ZuEMU5x1OQUP7qBz4JS3Gfn1KKI8NILuua9+3Rcuj+hWuWxCmIBbifMLqtKnFvUF
	T1PwuIe95wc7oUK3UDCovotnu6AGxX9HoR48wybOc+AsEl3BPGIFdJWFVylvtCOf0C92IwmLFQ3
	tLNbSPlH4SH7UCOqntnK0BFMrATC90Lplrgo=
X-Received: by 2002:a17:903:3885:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-290272c037dmr370560585ad.35.1760571628394;
        Wed, 15 Oct 2025 16:40:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7HhVlq2H00+aNIpTwkJCZaZoBD0dGl1VCEZ2khUGd+30f4enLpyoFJJJSvMggkoiC967TAg==
X-Received: by 2002:a17:903:3885:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-290272c037dmr370560315ad.35.1760571627901;
        Wed, 15 Oct 2025 16:40:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm8055635ad.70.2025.10.15.16.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 16:40:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20251014-ath11k-reset-window-cache-v1-1-b85271b111dd@oss.qualcomm.com>
References: <20251014-ath11k-reset-window-cache-v1-1-b85271b111dd@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: restore register window after
 global reset
Message-Id: <176057162726.260563.6168810416311335291.b4-ty@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 16:40:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: fOxW9qr6rCPI6I2Nbb2V_OZ4ztXc8fws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXxSsvwruRV7cH
 iYdYriyN0ULLOOZUxfTi+eYnIIpeuFFFyERdITEBQWrOyqzZKxE7A9C7kKKZBSoUAuXO8H2m4R6
 QNJrn8RT/A0YPHGm05B4BaE7sLTezhunrhvipgfUq+m5dfFvXBerwMEuL3kJf3yh7zmQfRx7j5I
 hC7EPQ/EplT2srWkyLzIxZ36CjzZ3PFpbNpbqbP3XShAONq9Cqp4wmgOa+kN1hsu9Y9op4pRjPi
 3Pr6WReBMfB5Lj2+l/IKYIT6wO1W6vbXSjOw4ENsmDBjGQkKgXeGFdOlILLkYV8HA4GuxbUQrNZ
 DSS5EmjcR9p69t8N3HbAvAOgp8wJFgtw/zzwhfbdtkQQ6r+xOOYjOADuWN1oaYvhlDvemORm65H
 qAILvaqjgHVUJf5fh1ESqzb9I8qvPg==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f030ed cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Ui3C-Q-iVV_s1S7Q5lMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fOxW9qr6rCPI6I2Nbb2V_OZ4ztXc8fws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_164030_938782_24548186 
X-CRM114-Status: GOOD (  10.83  )
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


On Tue, 14 Oct 2025 10:30:20 +0800, Baochen Qiang wrote:
> Hardware target implements an address space larger than that PCI BAR can
> map. In order to be able to access the whole target address space, the BAR
> space is split into 4 segments, of which the last 3, called windows, can
> be dynamically mapped to the desired area. This is achieved by updating
> window register with appropriate window value. Currently each time when
> accessing a register that beyond ATH11K_PCI_WINDOW_START, host calculates
> the window value and caches it after window update, this way next time
> when accessing a register falling in the same window, host knows that the
> window is already good hence no additional update needed.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: restore register window after global reset
      commit: 596b911644cc19ecba0dbc9c92849fb59390e29a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


