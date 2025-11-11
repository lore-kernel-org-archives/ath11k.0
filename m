Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F950CCFA18
	for <ath11k@archiver.kernel.org>; Tue, 11 Nov 2025 17:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=; b=PA4Sy8z007m37xGu48YpsGmy0Z
	G8Vxh8olxY5gDSHDXJ0K4aG4wC0j1DKNO0why0s5zIwRi8nrETU1/Acn7MImCtiFCSXnNdIDw45Ki
	5j7Aio0lUUrqMx9+OyaOyH+d7kk1NFqO5KReiXfwujrfa1Wowb20zOr8r4DNMn2mRzfiV8je5ahBZ
	LGno4pqlXJSCQIMf5GuEBTuqJw0dY5D/VW6gCNSWZ6kZTZRRmnsasYGC5JWFldZpG3Ccfl9SmmXC4
	gVKxQtKL4I/9wu1/iDa3PIy2eGVp/Dc6oBdtEFsqRPOW5bxUlk04A4kI4Vwii1lB8hy1DqJvpr3FW
	fL3jKpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAD-00000007X2a-2arq;
	Tue, 11 Nov 2025 17:28:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsAC-00000007X1c-0asK
	for ath11k@lists.infradead.org;
	Tue, 11 Nov 2025 17:28:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABBGI1P2117334
	for <ath11k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1yTPDHSc2XG60aIrPablLQ
	3QyMPBQoJr8FY38lTVHzE=; b=XbaScViBdNyZlvJaRxBTh1MRQ0m11aaITfv+7j
	JNqOsNxBJdpg7A1YVGJA8sWWsLKnnxVLnytsRzfgGP4PTxTLQIn+SutyD/8jueju
	fMTUQyGf5FDGN8e3MC6GgFVVotukYEDuG/Zuztu8IB31nKmRu85Bbat6C3Ch7qDA
	bMCWfeJ6Aqxyb2YieHsKOYT2eVSGF2WeV5NJECQdHZ7ez94T6c6tZHEucaT3Mzs4
	OU0dLnUHLnUb2U/4WlNEdYm4IxcdY8XXyRDbeHNwFOI3o9gPhW65JrLU3Oka8Mnt
	N6ZdOpW5zQC0th7teoBD57uURh/aXsZT1bS6Oz+ceULJ14GA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abpy8k9e1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Nov 2025 17:28:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c07119bfso11062504a91.2
        for <ath11k@lists.infradead.org>; Tue, 11 Nov 2025 09:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762882095; x=1763486895; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=atyEeZU11A7VgvFh94+jvQK7EQLCfjzakbI6vZsE8hbwhgskfoRK7u435+x8NbM3Ft
         tCU/aq7+121psB9pHFEZr6vXW3elhvGXAAFCyxvwe3CqwJsQyHIX3QtVfK+VgbcyroE1
         TWEPH8MHAzfRtioQ3zs3c76j9NSXXKvoPRUHUnST5RrmahIT582rT3AfknmV9E89VGbU
         KmZzaHRsMDS9mQvogtmCk9ID6X0cEnx00BL1lmc+hmGCAQZca8wsqbotC+G053IpD0/3
         JP4EvrVgublo0ewQrWCAkRofOI1vpgDzKQ8E5kkwM2bJHt7fU7fe4oN9Qx/OBuHQgVKi
         l2UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762882095; x=1763486895;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1yTPDHSc2XG60aIrPablLQ3QyMPBQoJr8FY38lTVHzE=;
        b=RWgn9cBgwrzcLzEibn/G2NEoT5wn0VSu4l2QrGbMjCmq27A7d1NCStoEsa9wJxAei6
         YYlRcPRGaLIcTld56gwZTsPA0544cpHKRW07LA5UtYtlJaiEziqakHUalpTKh6Fkl75L
         B/TOIkXD6HUYb5mtfP7rzvvgnWK6XVr66XxsFzIjnZ+/OOPA9Ptka6p/V1UKrtfC2XQu
         Fr+W/NMe8GBi3pOdTsiN6ncVzSHwQyz8Znf53FskjDmIe3/aarn6BPXgnvPmmkDvEqfL
         ugdJSI2NpIBdMORMf1yCm0btMrVTxeGCmIc3Su3MM0UxwS3jWO1eVNfGYYXRHqDpblK2
         oMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKU+0Lrf1ZkhA5VS+54OsCuwHdR9M+lOp+MFd5c9ZrkxzB/RikqqLD8q2H4BHBbjHlEW0ut1g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtWqfwdcllK1DBlqF/Hh4uLYCCTCv0pRAlL3T4yF9r+kiELrru
	UU+vvl4zja21jYY3nSXmcfkbC/DCsua+XfYzySrkYa3wrIR6Z7mAUwCTPGAGEpOuXUDUmbyDGpq
	u0CZz1o55EOtutqGzYRUXavO//FCBjk/ZOc3HWUSGK42hStIuL48w5AZFUcAywZNP
X-Gm-Gg: ASbGncv83j6476egEyrZDJ5beabwebA/TSA0e8JNRLOIpry3zzcmzRoBecQ4ZNxstkj
	hG7MKy5Djx4SbRvy5N9X2JwGhXhSvtpsXDhqGRzBNgLFAGQrAosRHpVJdR7Pb1NjfwzUaf79d8c
	u6RpI9opfRoQUoq3xMzWFi/E2xhVqflNMzOHZW3h97dMIt+mahr9yaSPm5DCdUMI9eIqGEnffC3
	13z+1sxXAGor96jGxRDnhkD9cequ7C5JXjYKUz527H5GeZGj57h71FDVuJKfFXT9bTu3ie+R5Cc
	Yey55hngsFINJAkw8ORxlBLUEfkQj7f6RsR54FoimFACtI0EAjGAC7Q+0tBdseE0C4veFI6cdct
	6B7zuIlS3ylMeSi1J6Y8WFJa5Ruw5Bd/VvEk=
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119190a91.19.1762882095000;
        Tue, 11 Nov 2025 09:28:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbddsu6FdKyudkS0lKZNwLRY1hL64MQLZC+zahT2rFZHB4c/OuxDy9ljnq3D8WemPe/3hrNQ==
X-Received: by 2002:a17:90b:4c04:b0:340:b06f:712e with SMTP id 98e67ed59e1d1-343ddec5998mr119160a91.19.1762882094449;
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9ff8538sm15987444b3a.28.2025.11.11.09.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 09:28:14 -0800 (PST)
Message-ID: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
Date: Tue, 11 Nov 2025 09:28:13 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20251111
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VMXf_LYlp01ywGE-ZDkO_dh0t0AHjnZw
X-Authority-Analysis: v=2.4 cv=AYW83nXG c=1 sm=1 tr=0 ts=6913722f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=Z3JRDe02xMfDgAAcrXgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDE0MiBTYWx0ZWRfX2PvzbVT4szWW
 y59fwRDmWOUJ4tDoLMcY3Bf4xXfc48yyjjCeZp27u7xcdbDHbvMOCyfZfiAJJd8Q8wzhLd2Jubs
 g2wPKZoZcsBFkZ3M33gYSvqf4Mto8hfZ6npS/OtNJI7XZw6BDGGRw/632uH37HovNUXPxiOYRot
 pcofGRLh7OqUK3SoqGYnsICC3tnw4LWBhBhDM+U2W9+5+p1wjPN+QvNLkYLVQpzd+ODxgpEq/ij
 Zy420FFxI+8ALqHc7Rn+ybvDpe99ZNo9MevSqp5Ujiw3EgsfAjrkWXnyR/CCq8SUbZOY4nz4RRw
 RmEBsiJScO5t/mMkIPBbtDLKfv78Q5psRNHgoRucQFgNQqy5RMjeaauSKDlYOne3WlABI1VirBU
 vLxfe9oMA+vZ/QSt6mrFZq4otRFvnA==
X-Proofpoint-GUID: VMXf_LYlp01ywGE-ZDkO_dh0t0AHjnZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_03,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_092816_211777_2F603D30 
X-CRM114-Status: UNSURE (   8.50  )
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

The following changes since commit 2f6adeaf92c4ea4adf5a91b87497ba13bb057996:

  Merge tag 'ath-next-20251103' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath into wireless-next (2025-11-05 16:29:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20251111

for you to fetch changes up to 2977567b244f056d86658160659f06cd6c78ba3d:

  wifi: ath12k: Fix timeout error during beacon stats retrieval (2025-11-06 07:33:31 -0800)

----------------------------------------------------------------
ath.git patches for v6.19 (#2)

Just one 2-patch series for this PR.

Once pulled into wireless-next, ath-next will fast-forward, and that
will provide the baseline for merging ath12k-ng into ath-next.

----------------------------------------------------------------
Manish Dharanenthiran (2):
      wifi: ath12k: Make firmware stats reset caller-driven
      wifi: ath12k: Fix timeout error during beacon stats retrieval

 drivers/net/wireless/ath/ath12k/core.c    |  2 --
 drivers/net/wireless/ath/ath12k/core.h    |  1 -
 drivers/net/wireless/ath/ath12k/debugfs.c |  9 +++------
 drivers/net/wireless/ath/ath12k/mac.c     | 15 ++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c     | 12 +-----------
 5 files changed, 14 insertions(+), 25 deletions(-)

