Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6ACCD183
	for <ath11k@archiver.kernel.org>; Mon,  6 Oct 2025 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=; b=CcrXMwNxyTd7QggLEPhHwDBOrC
	WAo1kbKmqrFbVoihURqIV2PpV8B7sALhZQOZ+teh2nhmgavMxqjWpUZT9SoBOqxj0KS5fObC3Pyuu
	Trk0Ilfz7RGMMk3sKpw/s9in0t82v2AogDxQuQn4/wHUjIESJBJqLsbI4KEvLtngafMSnI8XuP4QG
	bkwvK8i4RlVg+zn/GDk7NuAIE0rys/Sj6I4MBVCtjQaL73Ui6hlPHBhO174Zg1sOmKyc84UEJ/r7B
	Lx34St/YaHNgAtQO3gb96RS7xRalDgRHpqjO81isPgYuNqLP0gnAiKSH1GaU7vmX4G8RbPwMgQGX6
	3jAGCaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olK-00000000Tit-400e;
	Mon, 06 Oct 2025 17:12:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5olH-00000000Tho-3bgt
	for ath11k@lists.infradead.org;
	Mon, 06 Oct 2025 17:12:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FBFPt023916
	for <ath11k@lists.infradead.org>; Mon, 6 Oct 2025 17:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6uX8yMRU+RN3y5an9EtPvm
	iOJ+b25K/dHy7f3R3KmZc=; b=HhfEKCM7fnl6+pfb6gMNDtWYFwhTCpKvfexTHX
	/6/ZpRxP+xywLmYoKsHZAntTl94M8R/tQ/KqOBR7AYO+TWq8SnCLaaQsy0NyEGFS
	c414gNyua2Iax/hlGlP+oMNv4HDkX+cmyQleuPE4jNILGSat6IjSVP2/f1J76GPj
	FXr6dVGZ9nqiS7XGZ6WDGrC38ga7DNRYgrXfQm8PG6ODhtuSxIcVQKJhXKbhqFxZ
	5mcG3aL6Acadq+TBYu+FJ5jmV+iwOlSKUHMr2aMlGHqqXKf6a1N44H6ntqer11Ht
	FR8AxXlURGLwjkqjeyw6ktLpbCFXCo8U/od+WUQnmV5Xuoiw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mg6a8ayt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 17:12:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b557abaad02so6324221a12.3
        for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 10:12:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759770754; x=1760375554;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6uX8yMRU+RN3y5an9EtPvmiOJ+b25K/dHy7f3R3KmZc=;
        b=jaFk+WP672uGCOVRZp2KIVipvgwdDVjXJwpIXkbFXBxTPZJvTZwO5iaOfPJzzU7sZo
         dAJmU0s/+r37CEr6e95qATIf5NyMx6p8CB70BaJTE5RpYZUFFb0Z55Tr5i+VPVoLgUXv
         iTVMZ4CIc61nACRZTYJOzCLd+4MTGxzTOsQK8tl3yobnScXzkTXFNoL18aM/jqqP4s7q
         EEF4IaQfqMkNV1WHklADNtDsKgzyHYx7ByPSuKDLy0xEHkMHWYWGSlVkq3NXhsGpcIki
         uNIV5N7AAmvh/koR3Dg65MnlVdpl5uaY6zSOJYyV4vO/qffvRQByBJ8hQv4KcsQiWxbb
         FKOg==
X-Forwarded-Encrypted: i=1; AJvYcCV9amIFac/Noi25vpUTAxzPgdGSCI5XBb30dDpFkMRouzPZoWUtrFIbKfISW1SSUGchNOY31+A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsHHDNAxpnurRL9s1mRWGT2GoPHM/fUaFh1VPOilSGWKZ0KIIJ
	484/Mp1Y4WPaIFrZ160RDydATy+BXtldjyrqLg3EEPe57rf7EuDT6QEVZnwMWXF3qUCQCeRax9Z
	HmrMYvk2FK6CDFNqs672j7s4fR9mmCnaq+t+ujPgNfTX3Q0uEePka89uztFGRwsRq
X-Gm-Gg: ASbGncutLCMoD+l9umU29VARp4H3oE80UjQ1Q6UcLj+RvB/t3+Ajps0dPmij8wVDOvN
	54/iIdihIZg7sZ6dFpqEYKXJogBSrUTyS8ezvWXpNyPHgLExxclIPnuIKvZRvmhyaOiH8aY5dGw
	DWQ7X9Cx1DkS4lrA84miNvXle62Trau/OifRkrAPj9uRUKcdgmvfLKVJECsjWDxjARd5lL2EHEA
	UGi47cstg07rXko7oeUsg9HEmcV5talZHMayjv8A3eMMf7n8/RnYdhCxtcLS4G/JTWrO/ugmYv6
	Q+hmNDQr/6gUU+8bp9z5d6wuKbm36RCG6WWQWIJ0Zk7aS3pEjp72JPp7q4L4Rxrtmlj5TQYXZXq
	PVBRjbw==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494034637.6.1759770754472;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcFsQ5Cj8EuYVNyQn76xpACvpnbuvWlGVRXDAN6Io60+FOAQqunJFYDQCHg/w+DzTzrjT7CQ==
X-Received: by 2002:a05:6a20:72a8:b0:2c9:1323:f7f8 with SMTP id adf61e73a8af0-32b61dfb938mr17494007637.6.1759770754025;
        Mon, 06 Oct 2025 10:12:34 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b609ba636c2sm12363691a12.16.2025.10.06.10.12.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 10:12:33 -0700 (PDT)
Message-ID: <45843a5f-011f-4751-b9bc-004768b1454e@oss.qualcomm.com>
Date: Mon, 6 Oct 2025 10:12:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20251006
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QtdTHFyd c=1 sm=1 tr=0 ts=68e3f883 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=NTglem7-DTcMTCxUeT4A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: uPCf-covyift6fKJ2YhzJF8EbdXvYJJQ
X-Proofpoint-GUID: uPCf-covyift6fKJ2YhzJF8EbdXvYJJQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMSBTYWx0ZWRfX1Td02g6+ttGc
 3/0dhXNPfM/cj36w2eDZ3ZXCzcczIUga0IQVw2Jc6A/1r8Y9DlVe+3IykG1TddkJiSIlx5cE9NN
 3KK5lpRIrB/n4itsdHJ/RwqR9leS843DgG2J5qd8lFY0W+bpwMynsZI7L/1p+kggTpuCwjaTU/r
 9FbLFdZGFuWATNXBEPqtsnCtXkdlwNFdE/xA87FiraID18R3I+IX+2lTgfgtp5qFMbzQ/8MhUTq
 QMRh99BF44WZffNzlJYdJsCAPsIVBcqvKxhp+AdBK3fePEDVmgn0oXFKG02d+z0k2FU5CJhyUj4
 3NjPEExNTTxP/dq76wsRQjj/i6Be3oKDlP1T3y+2GBzY+s/l3mInaYYy3letFUcTSXIUJiSVQVc
 62eMRT4DAzwphDDYQp8sQ3tVUYpUog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_101235_895609_7646EEA5 
X-CRM114-Status: UNSURE (   8.77  )
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

The following changes since commit 4ff71af020ae59ae2d83b174646fc2ad9fcd4dc4:

  Merge tag 'net-6.17-rc8' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-25 08:23:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20251006

for you to fetch changes up to 9c78e747dd4fee6c36fcc926212e20032055cf9d:

  wifi: ath11k: avoid bit operation on key flags (2025-10-06 09:48:55 -0700)

----------------------------------------------------------------
ath.git update for v6.18-rc1

Fix memory leaks in both ath10k and ath12k.
Fix a sparse issue in ath11k.
Allow ath11k suspend/resume to work on more Lenovo laptops.

----------------------------------------------------------------
Karthik M (1):
      wifi: ath12k: free skb during idr cleanup callback

Loic Poulain (1):
      wifi: ath10k: Fix memory leak on unsupported WMI command

Mark Pearson (1):
      wifi: ath11k: Add missing platform IDs for quirk table

Rameshkumar Sundaram (1):
      wifi: ath11k: avoid bit operation on key flags

 drivers/net/wireless/ath/ath10k/wmi.c  |  1 +
 drivers/net/wireless/ath/ath11k/core.c | 54 ++++++++++++++++++++++++++++++----
 drivers/net/wireless/ath/ath11k/mac.c  | 10 +++----
 drivers/net/wireless/ath/ath12k/mac.c  | 34 +++++++++++----------
 4 files changed, 72 insertions(+), 27 deletions(-)

