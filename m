Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04D9C02181
	for <ath11k@archiver.kernel.org>; Fri, 24 Jan 2025 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBgzsddn1AaQ6ApTxidChvIRA2JVHU72+jsfbcvmvuY=; b=2xf6FS8Yzc708jVaF1yDiRi7EW
	nVwK1FMYV7V/sc8vDJM2u6VbHImmeSCVTiWEU3EDz2gM4u5yk5AGL3L3mfVJXtei7ijHelyDWUT4O
	SXENpVI8wfvvX2fVKKK+Ddb5JhFIwRdbop7SMsmKYLIUXxUub7UEbrhwV+335+whQ+UwBRBNvzCEO
	eJiW2DnzacOVf7QtL2L9K+xPOpkQ16WBOvYvY1emvWAgJ18LKdyhcYEJvOuF+DHUUFtrpww3NgnLS
	ytX6L7R3zboEmIEOyPCiGPrKAeQAxGJWBxR3pxXvrRXSq1jbE4vlajOV6nVuUmkwALCc4dlNYjY8E
	1budVoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPS5-0000000FOkS-2pKd;
	Fri, 24 Jan 2025 19:34:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbPS3-0000000FOjJ-3shf
	for ath11k@lists.infradead.org;
	Fri, 24 Jan 2025 19:34:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAlu0n031256
	for <ath11k@lists.infradead.org>; Fri, 24 Jan 2025 19:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GBgzsddn1AaQ6ApTxidChv
	IRA2JVHU72+jsfbcvmvuY=; b=Q9B3c2MHUslsCS7b/mUwsXl1s1CZoNMmHtk5CW
	eyfoxW6WbU+8htqeZDJrWsFrtmWX44cdjGrKvFGOK35qjHD30DNmEbUbh20C5ZZn
	yasf/SlG+ctYUqtodF0vQcqtdUX73ZOckul9ZQJyWvjdYqYudzYIYuNKUsa23uue
	Ou3bbxy3jrNpij3A9uTi0g95/R4wp+Ip0P6upFWvdmex+LTxX4/QPwUXKH9yPhwC
	V0JR1RlzKI9HyXTE/dU9HLBIldZ1Jj0JHoVKF69B9pBKCYguNqYI/xq1kuZJHGYN
	XKEvVsLMFoR6SF9udJgYWV/gqEsbdbEeUpjYYolod9O8PFYA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9e217sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 24 Jan 2025 19:34:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2165433e229so48472665ad.1
        for <ath11k@lists.infradead.org>; Fri, 24 Jan 2025 11:34:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737747284; x=1738352084;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GBgzsddn1AaQ6ApTxidChvIRA2JVHU72+jsfbcvmvuY=;
        b=IKRLRdcgxnwzVEkon/T/QR6bbEsP9N5rnGaQ67Jx4AmMCY5GP9E/e68r7nn+xAJ5fR
         n/WQodUj8PJJHogqnB34v1/ntCac6V+qZrzESuhTNif9/l7oFX9MCJaXFWSG9IRrVH50
         odih72nsI6I5nbxZru0MMA4r+ebLgnc+pC9YxsFKeyQBZGUuxEmoc1CV6+rmISxNmPK6
         k0OqXX4FPUuc49qq5tEa1X8V0J3WX2COuCxVRZtMHTLkuFIGGDiyBDvhfiOhXJ36Bu+Z
         GtOlWxgWnIC2gDgpA65J1DzzDEx/PIPDtywv/NYc/pjwiKAx5th7TKtxrMIxQpIgT5FR
         prWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsC8qmvUNv5ZxAEP6Fj31IFbWoKaa7on/vxzmT3XOwi+bCJljxa3q8NFKQVkJtbfteDNJwre8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLsreey4lq/Kue8Rl33jiavn72i5wieTier9gCzcpfJLB64Bdm
	Wjy3nJqqqRnpuTTtn9aSjuGkCkQaT1mYm/ligm6wmq+5vcjeWEkWlq5bmltNLC4ujeINEfpVywo
	rXPxQQaGnAnsVrGfy2vXkliDXzWZJIr9830JJWO6cPA5lvqkd7eiTnsvInTkX
X-Gm-Gg: ASbGncvBl3TjKxNADjjds/AJY94wtI8tvMltnEF0USfCoy47ylc8rCsznln+ZAqcIVL
	roXaE1nwAGYam0aeTkrggqLpXkJvNgXiKPkNESb2dWtN3ixTjFeNQ3Ep3KhnY6Vx4atO+MoOrr1
	y6BNL9FDKqoDPhHJmuv9n0USrIxHue8MxXzEEf5WDDeQHznqQ6+YGVIKfBcqzIyCInebccA0Xqt
	FSf3gHC2Rt2EklT6nzL5ahpJFszethrXF25EwGaBFc+IcdvbGBVm8VT+yJI1rDuJVG49uSnCc5S
	go9Vbp8Eu4gGcctSNz3FRrrlL85uir8=
X-Received: by 2002:a05:6a20:2d2a:b0:1eb:3623:5a13 with SMTP id adf61e73a8af0-1eb36235af0mr42494884637.8.1737747284131;
        Fri, 24 Jan 2025 11:34:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSJA+1ljjIJRHkf0iGymCofgHmiawKyhAgfKNlM81XtiY2GY7mfJyGWC+MmnJGoRYnSLZeyA==
X-Received: by 2002:a05:6a20:2d2a:b0:1eb:3623:5a13 with SMTP id adf61e73a8af0-1eb36235af0mr42494861637.8.1737747283801;
        Fri, 24 Jan 2025 11:34:43 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a78ee97sm2264332b3a.166.2025.01.24.11.34.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 11:34:43 -0800 (PST)
Message-ID: <3311fea1-c7c0-4929-b92c-16ab933de33c@oss.qualcomm.com>
Date: Fri, 24 Jan 2025 11:34:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org
Subject: pull-request: ath-current-20250124
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JehPFMscJMnDQ1AdzQueT5xr5XCePga4
X-Proofpoint-ORIG-GUID: JehPFMscJMnDQ1AdzQueT5xr5XCePga4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=972 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_113448_088413_350B9B9D 
X-CRM114-Status: UNSURE (   7.83  )
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

The following changes since commit 146b6057e1fd28fb1a38d300bf76a38dfba7f9fb:

  wifi: cw1200: Fix potential NULL dereference (2024-12-18 19:58:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250124

for you to fetch changes up to 64a1ba4072b34af1b76bf15fca5c2075b8cc4d64:

  wifi: ath12k: fix handling of 6 GHz rules (2025-01-24 10:32:44 -0800)

----------------------------------------------------------------
ath.git patch for v6.14-rc

Fix an issue in the ath12k driver where 6 GHz operation no longer
works with new firmware.

----------------------------------------------------------------
Aditya Kumar Singh (1):
      wifi: ath12k: fix handling of 6 GHz rules

 drivers/net/wireless/ath/ath12k/wmi.c | 61 ++++++++++++++++++++++++++---------
 drivers/net/wireless/ath/ath12k/wmi.h |  1 -
 2 files changed, 45 insertions(+), 17 deletions(-)

