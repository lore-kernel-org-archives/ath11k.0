Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6E1F8FA84
	for <ath11k@archiver.kernel.org>; Tue, 21 Apr 2026 14:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=; b=QaDxx/beNgv0I9dV6YiCBRoHLa
	WgRydW5KkIufNLnFKAPBbl7IaJBYPnDVlu9Sy4AVqQYAB4FxeDyCfNSUhbw+8Xyf6+YooQmlpCTET
	aglsygvCJcg2afiXFL+foWR3oW4HtXZBnYFoJeVqMrBmCCAgUSaZgp7i3krwyWG1UMBtH8YY3WiTr
	qxugkkGrrP3/NileVB6AHxKAV3mBGMCBOSKIXjdZ80eAl92E3nOw7gBA1AoPIvwCwZqf5NCtCGA2w
	hjstho7LygyJn6UKtOK7y21TbZwRxrzsz4ZGhl80IX9XpTPrM6xGD5YYDj8tHcTF0OjZ3pY+DN2zZ
	Jgn5Y2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCD3-00000008kGy-0iuL;
	Tue, 21 Apr 2026 14:36:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCCz-00000008kFA-0gSm
	for ath11k@lists.infradead.org;
	Tue, 21 Apr 2026 14:36:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9jH2a4168361
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 14:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DWPUc7al7seOtzF17+ZKNA
	mhSS/cjwEU4vt4ddqzkso=; b=iy++ZPrIOWmSzp9tyjXuKOP9e9KyDuuQpabMo1
	faj2cCewDGJeXhJ1+d5zhIyQw++CZDzl7A0VX6o8zpbw6pbjAD1o2BoCN2NxrGMJ
	37GvrFTiVLJeBjujIlT4UFCXgbc8vBbM5Ogp9muEds/6z4BtvfKJ3XSnPtgbWu6A
	LGzzFlfMW2uPHMbo+PWFqnYPejNTyDbgL2pz88GrOGmIuVKFdG9kjzXYFslQ4bXl
	w7VzJsczcpj0RLYIs2BG3AQXdfMMkPg8KiidoCNTUngOpFaQSma6I2JiYfGTsGzO
	aL8turnswMAap/7zX8qHTzT7qlbDPcLm2cFoKRH9TcNGJGVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp1au2d7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 14:36:12 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf75bc88fso5136631eec.0
        for <ath11k@lists.infradead.org>; Tue, 21 Apr 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776782172; x=1777386972; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=Nhy1xnHy/idVp5NxmiW1WIzxoSUxKUF/lxj/4Ie1dzGwH5BBp31VAcSh6rXw+7krc3
         pdbkvu6YH4VRcchOjgkQctfrHL6JpjL+2sFuJor8ofit5GOMD47LWawU0Otvoij2m/J7
         ttV9z2oNewUhpctnUCq0bIBM8Yu6cK95Rtk0G3+vZ0dHg/BDidSKFwQqFrfWoIZUbVHz
         h33d8GFDn8/HtQifPkGLXwVf0XKJkhNi0sQ2qAV9pHLwUISRKk6tdVyTiIq92kRgilf5
         GdiYRf8NBwuarS/roBMu99T5AvGnkGo0UStRfwnT+3rrSPlPJj7nRJU76Sj3sRJa31tn
         aV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776782172; x=1777386972;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DWPUc7al7seOtzF17+ZKNAmhSS/cjwEU4vt4ddqzkso=;
        b=DELxAhQV3sxnBsDF6ezCsL5FZg98gVUS2HrsSYWUEe6OLvEuHdQTM3LJgMFeF9NxmC
         AqjtmmUzjNzkhINVB47lGNwz928aVJ47mAMx2CFYvhBUNehZNJn/T+C2FjIaHUSWc/Lu
         bsd3jmebwEozwxgNBZtYHhWxNEMs24OtSBjeXJiBdQCoZSgkCmE7HsbtuNXkO3WPTZ6r
         khAOLMLMDNEMrRWx8wG7HQpOwMRBryziGfhmbxO8owCpRrGlmkrS9imS6UAKTOVjHfxV
         g3e6NKo6TEF0kfeXyzaEehymqFE7+dcczMyZ9lZ5oFpdxEOToMIjbwCyZM+C/sXIqc21
         /SUg==
X-Forwarded-Encrypted: i=1; AFNElJ+lKwWhOIZPiSTa11eA0kj6ZJwjFRvUBhEpcRjPwSfTApBhA80BARyAStA4xDMJa6Ab6DureKc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwraLLOo9JO1dTEMhZicQRKYcNb6fimUOM8JCyJqCVSGIvnwbj2
	sNnIePNYtuNIC2dtJ7CBh/m0U0V9mEhHKWB/w2PjrUnwIzCjQ6bYjQTredmdMt4m34muhPrjRO6
	YZxAHRe/URaCrSA6dIHSunSOeK6c1XMkB54dxSCdLJSC64ZWsIGnGud+KEm9q8Wbv
X-Gm-Gg: AeBDiesxHUoKBFUUYzunUNibiOfNfJHH3xdc/N0Wf7OifYjRYmFheZLrBcu8usETIqp
	mG2o/NNkvnksAAgODvnbX7zGzirPiru4Lxj/xE5EUdhhcgabR0ytlj8ciJDJFXNVcudnzQ4sE+I
	tNoEWA82xFxSg+0/ea+iYd2CVz1gKqDQ5an1ly1NwMNHAq3PnLcptRz8DwqIBlFRKHtT7br9EcV
	lyOHzF0wrxagV1XsSRWkXVvc+pG54IYmT1vEi5VJKYBeM/MunmgUcAnHtvePpRAuBUYu+0EgbMY
	ahKUPulH6PctoLkMAGJyrUIRX38gjHPbOy6LCCI3/6QOIVOYNuvp6K2bVij+miIHmxkAo7iZN9n
	mHPDIb/KK5h2OYXQgRT2YoSwmFAvW23jaolpmKkEQfuxE0ymT1+RGVXVZHdxJQ2oWi/ur
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635755eec.22.1776782171425;
        Tue, 21 Apr 2026 07:36:11 -0700 (PDT)
X-Received: by 2002:a05:7301:4704:b0:2e6:e77d:7bcf with SMTP id 5a478bee46e88-2e6e77d7e0fmr4635728eec.22.1776782170740;
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a18a2bsm28627176c88.10.2026.04.21.07.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 07:36:10 -0700 (PDT)
Message-ID: <b581cc04-f5cd-4e99-9251-523e50623b03@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 07:36:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260421
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE0NSBTYWx0ZWRfX71qtJN8QexEJ
 yFwn7Vmk3h3R65RnmDRzwVmGLOvl7cBuLN8jW05UrmPJK1pTgNPFlhnGvtC6FAhurEscLvHQW1X
 tGmqdP/TUDMNCJ74p2mwasClq21WIHsl2m7o3tqGAeP/Qqpz0sJiQI8MmYzBUJ0ODZBWiIHfoAk
 N6ehU+kJl+HjatvkNHEQ/PaOTVNECr2JXq5aM5EYucQoLxkk0IuuswfpA0s0kvORd8vSVZrQTq6
 iq55rCXasP3M4YgYRSphPvegzaHHnj/zMtoFzE/KlI+SWPplPNguzVV3U5eD2O9xqcSzvB9H2EO
 ztQgAsY7iuzBXjtjjusz7NcmlLTQWRAxwHrGJQqqeGnLU/pgMCP20ViVPZ3k+KFJBM5sPePOzfy
 WbMoZbTwiwnqaU0HOWe1v2FHgnXxNVIQtfwn8iyQJzWGWLkvo8oFv+XK2QN2uYMOlOpUSsWFbuK
 1Q68P98owHXsd9tj3/w==
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=69e78b5c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=Ulex03xzRqfrDqNhIRAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 53R7Vok8F6d-2q8Y3ZGxy5MdCVKZIjmL
X-Proofpoint-ORIG-GUID: 53R7Vok8F6d-2q8Y3ZGxy5MdCVKZIjmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604210145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_073613_223552_5AFEF94B 
X-CRM114-Status: GOOD (  11.15  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.
For ath12k, add the initial firmware and board files for IPQ5424 and QCC2072.

Please let me know if there are any problems.

Thanks,
/jeff
---

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260421

for you to fetch changes up to 5bd6cbb6ae899e81c1ac3f6915af05e26a354b51:

  ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-04-21 07:06:36 -0700)

----------------------------------------------------------------
Jeff Johnson (4):
      ath12k: IPQ5424 hw1.0: add board-2.bin
      ath12k: IPQ5424 hw1.0: add to WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
      ath12k: QCC2072 hw1.0: add board-2.bin
      ath12k: QCC2072 hw1.0: add to WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                               |   11 +
 ath12k/IPQ5424/hw1.0/Notice.txt      | 3987 ++++++++++++++++++++++++++++++++++
 ath12k/IPQ5424/hw1.0/board-2.bin     |  Bin 0 -> 353740 bytes
 ath12k/IPQ5424/hw1.0/iu_fw.mbn       |  Bin 0 -> 348152 bytes
 ath12k/IPQ5424/hw1.0/q6_fw0.mbn      |  Bin 0 -> 878224 bytes
 ath12k/IPQ5424/hw1.0/q6_fw1.mbn      |  Bin 0 -> 5623872 bytes
 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn |  Bin 0 -> 20404 bytes
 ath12k/QCC2072/hw1.0/Notice.txt      | 3386 +++++++++++++++++++++++++++++
 ath12k/QCC2072/hw1.0/board-2.bin     |  Bin 0 -> 401232 bytes
 ath12k/QCC2072/hw1.0/firmware-2.bin  |  Bin 0 -> 7111860 bytes
 10 files changed, 7384 insertions(+)
 create mode 100644 ath12k/IPQ5424/hw1.0/Notice.txt
 create mode 100644 ath12k/IPQ5424/hw1.0/board-2.bin
 create mode 100644 ath12k/IPQ5424/hw1.0/iu_fw.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw0.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/q6_fw1.mbn
 create mode 100644 ath12k/IPQ5424/hw1.0/qdsp6sw_dtb.mbn
 create mode 100644 ath12k/QCC2072/hw1.0/Notice.txt
 create mode 100644 ath12k/QCC2072/hw1.0/board-2.bin
 create mode 100644 ath12k/QCC2072/hw1.0/firmware-2.bin

