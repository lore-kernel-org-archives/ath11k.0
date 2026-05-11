Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC58CD37BE
	for <ath11k@archiver.kernel.org>; Mon, 11 May 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=; b=Y+IRHKmt24E7oNJx7LsbH4hBR9
	OFetnmWfQ3QeAHaNOabXvcxQ8xs8oX8Xk/1APxm5HukmWVEUNX1TVcrwoHQKK4umogLiYSgFTtc1L
	CrVMQHokvqsiyAwDH4ayPY/8kvjywKSv7CR64tluNup+rsKgkbwDf+LperhFbNFeaK7c3HLjg7qo3
	BLRYQYDQQYcH/Ptd8nsYnGUevHFq/8Z1oVJNYRKH438lmCyWxCEGt7xpKQVgvPwXLVVo/yb+dK2r8
	D0d2lk9jMtrjX/u5D+1ITMC8ELW8xB4JgCW2eLrSj4qXA9uXcI7PnPMK8EEzhzzn3PxDfqVlOrNBT
	UMgPjBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA4-0000000DzcL-1AdP;
	Mon, 11 May 2026 15:03:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA1-0000000DzbB-2tDo
	for ath11k@lists.infradead.org;
	Mon, 11 May 2026 15:03:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BEpuC21513387
	for <ath11k@lists.infradead.org>; Mon, 11 May 2026 15:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=; b=YApZwCjPaYhXn1mO
	v+0n0Sdpjvehiq1To/+/ivPBwksE1AOgwM+btFf0MYtPHBBgEmDpJ+hWDndZ9ih9
	TX3neOrQWuqPc6Nf5LKed+Io3JgM4FFBQSSoLegjoUGjK4a6x8iu6wLjBOY6l6dv
	GgO8URKPSiviZZnvMvH37/VvnWMJ7TSvjOxx4iQ0+NLm78aCrAr2v+NYWGFCy9IF
	iRMEZM8UBQBtrw4rzK3Hiiup+kxLVJIoheokDrZsRMaEZe7szLfGaXnCDZGTQYtp
	TvPScqPec2l5Pt0Vl2okkqkwmMQ7Z/5F2vZeRPSAdQgD3J05zxqvalIbw6bMThEN
	4QlZ0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3h8g81t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 11 May 2026 15:03:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2eebb099efbso2568078eec.0
        for <ath11k@lists.infradead.org>; Mon, 11 May 2026 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778511788; x=1779116588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=;
        b=OZUiAlc0NEdRuR39ssVaC+o5Ncf8qyYYAiEjFhzmEpMiRHI+6j2HvA8gH+5pjSoaDG
         PwIx3EuscQJpQvSlONIRe105xzCBlY9A1um4VtF5O9Qa9fvgUCmmckkQ7e0zOAmmAIEC
         FAQTal9pKvG1CTAsHNEc5irWgyLi1GeXvpdHcc+OlkJRVK6iHu7+5IyExFXN3h2i8/xa
         +yzcuNoWugUA3M5NobtHBLjbvNLVstAtH3f8fpMqRqNw+WWQ6Emzvy4JcKDkeYYozESz
         0/vm1QdfRUPBXyvysqpKpHlg1cF/G4HpCchKWxqmtjHoKAsnWJD/t5dNgGHipsgqo2lS
         qLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511788; x=1779116588;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfOJpH+Ek347nwgYropma7A+OAstc3H0lM5M2WgtI0o=;
        b=VR/sYNHedFluM8KXyN1D2pZculXM6DBlFqwlOBfsIGi4Qv3LkJpe848I0YipETkBbe
         bZOo6AIRRGKe9zEWuMpu8OjqCFkt71dpnDTXofzYZ0MEfW+h8mB/LZmQvZKPpbFKWQ0D
         jD4gVapLhXIc0p38RsBegYLH+NuZ70NJ/OcjHge98hl1fRoeTd31dAK0S66q2ZMgz6zb
         w8J3ba+SP2neZfRXCkfxUYEP43UVensZ1gal46U6dFSf+fyCPhiVgmxVckwC4YNVXjrl
         BCTeXCG1pC8wZfBq3m+CzTBMgjMuUl3+ogbXOEs1FO1pxjCMRa8YOkKNA15FJKw/LiO+
         ioJg==
X-Forwarded-Encrypted: i=1; AFNElJ+F185bt7JDnEbbRVO15QhLw20/u15jnHO/0xijWzWK0818j4ZW8iXBK+Nm0AqFbbBpTuOGB30=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3XgmeV8CFe2YUeYGZ2LxpEVd1tHxI8V2iE2SVE47CH0qP/5ew
	BeRVt8Oy2esFz192f5gJiRkZsQfEBUzeDtoOfDs9CKNokfqUpfWcPLl3PokpYoFZoSLrb3jQPmH
	4jljXZDmxoXPvF+nt6ylzsZsvGe9ZW1ubTdpfoAzbPaRrNWuDFoHEYRhdmfr/A1im
X-Gm-Gg: Acq92OEDnfxyUhuRBeOZgj2jr26+bTnC29IAHXi8rFRBamDxLDNBt8QE6e0KaAYP1x0
	uYJTmXysk+Z5TVMQ8WPbSNLEah3Y/XcTxJEOsnVw66587YXlM+MYlqWMXgVXQgH+swwux+GON4O
	IIjs2M36mxl0brGsiXXejd9OJtQiNfb3Bep44KljeTd1acdYjxmy+ofrPQ1hPf+/oNcA7TPuXOf
	3piEeptnk1RVnzykwCrVFd2vMBvw0qWtNtMJcjasuKRvb910LTYx5S67uEJefNBIyXVARtln2l8
	bHaCpsY1VNLHVQv4ZZwrk40st8rpacHSoX9bPc6fCdzBg2NgHFp4CC+Yi4E4ozuvtL23mMyW9za
	dM6ZHrG8tmwqsFUU9XYMqHhiy9+d7BFCkF1PEcaiY76rdS9Z+4ktOGxgjHVfS9/frdp9rp34Q5p
	Vq
X-Received: by 2002:a05:7300:8623:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2f54da9251emr11486706eec.33.1778511788101;
        Mon, 11 May 2026 08:03:08 -0700 (PDT)
X-Received: by 2002:a05:7300:8623:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2f54da9251emr11486624eec.33.1778511787411;
        Mon, 11 May 2026 08:03:07 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm17330453eec.6.2026.05.11.08.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:03:06 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
References: <20260317180833.3061582-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath: Fix the license marking
Message-Id: <177851178607.1372190.16665093744685318001.b4-ty@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:03:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2NSBTYWx0ZWRfX+0bL2eqc2D4F
 SwfA3AzHmBntXCNGrptkNW54SS/YldnhwG2lR5VnbUVqMzhjGtI7zB/UvtsWMVJEn3wumH4tbaL
 04GHGj0FJfAdS6eKjbk7j7il10acAgGPbHfDUTpq5qgic7Ayk572XzUXHZ4dulMuU34JypDeHdl
 b8UTOBvMibZibVT0DWDYCNaMHai3FOTX7HSfADZvhYPdmROiuPMC1sPCXli21kiJdLKQGyU5LS/
 Gw0WLjkPnOzEn1d6bJ3Pxz+CD8dZrtbcxxUgLtEi16vaaZICBg5H+Zz0p7BpbiT/fpVYQFG9sza
 XgfYe5phb0o/8WzDlPaQOKjmicbwjmzetdlV/7xd69pU4S2PdkjCHa5jrbjuz3RAMFr7i/v9Ruo
 nWZT3MwS9ztwTeRGVLBkD3HkbBIlaGPEIE2rx8acRmNTWAREMl+kp765SYCWeLtoMPEsceYwccB
 gUt12sTgXhTHf7aeXiA==
X-Proofpoint-GUID: _DdEfgCSHu8dqd0dwxRK5VlRYhIlU0pE
X-Proofpoint-ORIG-GUID: _DdEfgCSHu8dqd0dwxRK5VlRYhIlU0pE
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=6a01efac cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_080309_737030_9256F583 
X-CRM114-Status: UNSURE (   7.36  )
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


On Tue, 17 Mar 2026 19:08:32 +0100, Daniel Lezcano wrote:
> The Copyright for Qualcomm changed its format and replaces the old
> Qualcomm Innovative Center by Qualcomm Technology Inc.
> 
> 

Applied, thanks!

[1/1] wifi: ath: Fix the license marking
      commit: db17e958184be9fe2b6242b7c5b7b261c0ce7110

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


