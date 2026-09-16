Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF56C982C4
	for <ath11k@archiver.kernel.org>; Wed, 16 Sep 2026 14:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=; b=aP6QZ81XCMzWmNsPkYwnbZN9ac
	bZt7BklA69/SvGsok+p5rsrSQVYIaCvv8uFv4ofI7HgO7+7K6kKDNP/8Ip5rti1wtazs7O0FZXLaN
	OG4B7oQzw//YZ89M/WHEEtQmFaJVxLLgp+s+K9iUGy4xFT7QEuLLC5aZMMC8gcq9pmQRiEoXjvF7v
	UZf7DhLlc759/flV3fEqO0zX0YMSnGRQ8ilf2JUkRC7EofwZESXnBVToZoe342C02C4Vx43Q5Q78H
	hOz3pchkI75CdyKtjiQDsCYvzpu0h0kVwJ4YF9FU5Wvkfn//rP972eCzWUvEsoj27UnIuIdL3Dxlo
	JWU7Gujg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjH-00000009R0i-0X5j;
	Wed, 16 Sep 2026 14:35:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qjB-00000009QxK-2Scp
	for ath11k@lists.infradead.org;
	Wed, 16 Sep 2026 14:35:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEYdvx3079231
	for <ath11k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tK73FQp1Mf4ROUthjYwNJv
	g6RzgXr9daOQTchTpQz0Y=; b=L0nQhZkF76DbWVUbzThVh8vB7xUgbcm0FtGT/a
	rxlY1dSRPIUll5FY2PqxadXEkiCERctY65OxkZZUdACWNKpv/4GGVilCFPGiz+C/
	RwfqYUrYQ7wIeYMm7UnM3l72YIVjb/aeUOA2ZM91wqDfkMvykSkgqpyozJNhC7gz
	EnSHDx0P8Hhw+Ejv8nYrwTKqhkwgzTxC0nHGJY9FBwj61OOb6QHlKVD8JeGd6DSK
	nX/SRhPO9HpWZ/jpz7aqgb14tKWaREcF6kNUq0gaQg7hqxdkJYVXIhkz0UibmTm+
	vaKqVcizSf5bgONd1Zu6gYWYy5lhKC7DJli31FefwN9dUQSA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywbqkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 16 Sep 2026 14:35:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd188e16a2so66204715ad.2
        for <ath11k@lists.infradead.org>; Wed, 16 Sep 2026 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789569312; x=1790174112; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=e6YnLtmpdh4gl0Qa5Cj1SGm1nCgqpT/tSefoIxYdpb7iZnF5W2CG+OJl8IL7lvjSxo
         5I6jkwPvio1P1mOorppsBkrUQ353HD3Q57ygXSuCwfIDm7PLNNZcmWVio3yf1zhVkKqT
         IBhNrpP89IZtl8AqLKZzR0tP+GvouP8NpBjgAlIz/XxaROnIHuxBdFf70Kk9bjUDhZAN
         z3NZLlKJalDowiM8Ybk6/ska0/sSAiKMJlqwEP7DJvcmXB3LxgkTWso1eK/wQ/KN8BEK
         9NkEuZsT16BY9tvp9S8pWvYHL4B7XWosLF3vWArPx4/926nBlS8o3jrvCVKu5BQXceqq
         xM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569312; x=1790174112;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK73FQp1Mf4ROUthjYwNJvg6RzgXr9daOQTchTpQz0Y=;
        b=eGu6z0SkyTCskatCadzpq5DFKnOnKlWOMa013rkOyOmJxMh9/ee4SSKJo3mIb6f9YV
         JhEDlqdvptLCe85TD/uEnfnKo7Vn/4k5GVz+NdUmm/uWMeEcWEQtKMR53gsKY6aGrSNL
         bRu63DO4RbGpvVyjlFtB1fHf8tL6a6Yu9JFxF6Ob3STrBBy4I5qNYdA4j+HnA/ajba8U
         dUZAWJiSeIjYcR5T9IOtMRMWxBZu8P+E4IvNK4qUDc7fMA1qid0hDfxuJhJDNmoJxo3N
         /1+Tr34HaBK6SKVGqApwzYyEbiDqI5WJfpxv7zTJ+GyZw08dFwpmADkhzfiwHo1JNsIx
         cbYg==
X-Forwarded-Encrypted: i=1; AKwUvBxUZOvboErlT280K9O3NcqlJf7ti4W4bm/mDO9+zHvjd45jumGFqstiLU3bg5zVDh/okm0WtMU=@lists.infradead.org
X-Gm-Message-State: AFuF++kPrIOqL+tgInXhySu9k6qPqagazhHJJXRxDe5d+tWL2INgELCg
	Z1isCd1Bv/LSTFJL8afatz1681Sqh3LNBHqbToRwZK3iirssV5Cp/wDlmMe42FYzErI3V34YvJQ
	GH+yDHTIlifPy3QKD9o8gsGnGLfYZYf+cFsVblrztvzlLShFfKjgE40gQkPLW8Jpy
X-Gm-Gg: AYBFou1z2ELNNYVxduG/hsAmcot1LNgfjoxP+ximJgCaWov8w3UjIksxiJ5p6mYoVlL
	nrLzkLDufs2VkwzjgYZBpzHFhkKf3FMOaGbSf94QmgSdyGzZ0ZXLUIYtHKw4K4IrAvP6n9PRQ3k
	4duwPJV5Jza+hMXTscyDATaOLAPOu/zXhGAhKmJPNoOoj84XSQBMllbGXhKKLTl49ZoE2uLeb0t
	7Oza5JqC2PIzXWn1JXtdEyO6Tv8xy6ZnQhBVh0EYeKL3cjO95/+NqxQxcUXBdiboBxkT5WnzSb2
	bGchxzD3q7AB2qT4isZjDiloPSXHHROMWBOHXlwo4lSEBdTdesDBvSc3zerXuueJlEpcUMSmYVO
	gWULkgdK/tC/52tmS2+id1ZJFNZzPEgceJ04V
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216675ad.0.1789569312191;
        Wed, 16 Sep 2026 07:35:12 -0700 (PDT)
X-Received: by 2002:a17:903:1990:b0:2dd:3ddf:b876 with SMTP id d9443c01a7336-2dd8cc8bc70mr59216005ad.0.1789569311628;
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89eb7496sm13023775ad.38.2026.09.16.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:35:11 -0700 (PDT)
Message-ID: <ee7037be-6cc1-4bca-b732-42130483f469@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 07:35:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260916
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hGJwSBYS5ipnEt1kDJ98q4coobOlF9mr
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaaa921 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7zb2UhBhSU3A8DwyPNsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfXxpiRnAofWGJF
 HhugSxvh5IFvEGXRNwgqyPHudYlKssDbBOTLvIpVieRe3c3sI96v9gGADzdMh/+0BjLDBTiY0kn
 fXsd1J96pQ5yaYzWPNUBOBB3AatOmmQXGHIoaFuzsBHsO22ElIEWaNnxUDurEHd2VZzow16KcPY
 Mi30L4pcDazFq92ZXMTRdpsJeRZVArs/tdCsnJ08D/mvoz6t788lGBZm6CPnYwydTwnpzfndQu5
 wuIt+U36/qXF0kIL0XumqPbql7IEfSEe89HLUFVVceg9MXlaBkv+kDxjaHYZHOlibeJOg5SsjbL
 BJ04oE8cNQXC1is+sLCnV7ZZLTOw+zmaz+6h/09d8E+0pQ/mOOhS3JbQ2WRjErErLfycqbMeUQD
 VeMBa0AHuxYY9IpNaajx5F+RY1JOp8Cugl/tPdF+PNthedzNMdHuX35bM1j4PynzXeXjRUA7Axu
 RMPU2G500a/UdCsN6MA==
X-Proofpoint-ORIG-GUID: hGJwSBYS5ipnEt1kDJ98q4coobOlF9mr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE5NyBTYWx0ZWRfXxeXSuQb6ohaY
 P8Cyr4A69PV3gOx52WKFbLMr5rhbSXVjs90I3+XDyGI3N3qOjDySfsLKQYPd10gTT8GwL3QllL3
 G4weZ2nOWnXZxjPDv6xS6CdMZ9HDkfo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_073514_147670_56095BA9 
X-CRM114-Status: GOOD (  13.58  )
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

The following changes since commit 1b78070aaef63512688aebfbc82365ef9d6660f1:

  Merge tag 'net-7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2026-08-27 13:53:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260916

for you to fetch changes up to c3bace8584ca707e34ba837f65c2e9d566af4c2c:

  wifi: ath12k: add support to load shared firmware on multiPD (2026-09-10 14:29:09 -0700)

----------------------------------------------------------------
ath.git patches for v7.4 (PR #1)

Add mailmap entries for some Qualcomm Wi-Fi developers now using
@oss.qualcomm.com credentials.

For ath12, add support for the qcom,calibration-variant Device Tree
property and add more infrastructure for the IPQ5332 platform.

Other than that, just an assortment of cleanups and minor bug fixes across
the "ath" family of drivers that aren't urgent enough to go through the
"current" process.

----------------------------------------------------------------
Aaradhana Sahu (4):
      mailmap: add entries for Aaradhana Sahu
      wifi: ath12k: Free allocated CE IRQs on request_irq() failure
      wifi: ath12k: Free allocated external IRQs on request_irq() failure
      wifi: ath12k: add support to load shared firmware on multiPD

Abdun Nihaal (1):
      wifi: ath11k: Fix possible memory leak in ath11k_dp_srng_setup()

Andrew LaMarche (2):
      wifi: ath12k: support calibration-variant from device tree
      dt-bindings: wireless: ath12k: drop qcom,ath12k-calibration-variant

Baochen Qiang (8):
      wifi: ath12k: signal regd update completion when reg event is dropped
      wifi: ath12k: use per-radio ab in ath12k_mac_hw_register()
      wifi: ath12k: protect new_alpha2 access with base_lock
      wifi: ath12k: skip setting country code during registration when unchanged
      mailmap: add entries for Baochen Qiang
      wifi: ath12k: use kernel types instead of userspace stdint types
      wifi: ath12k: fix stale skb pointers after aligned TX payload shift
      wifi: ath12k: fix truncated TX buffer DMA address in MSDU ext descriptor

Jeff Johnson (2):
      wifi: ath12k: remove skb->data check in ath12k_wmi_process_tpc_stats()
      wifi: ath9k: use rcu_dereference_bh() for sta->rates in ath_merge_ratetbl()

Julius Bairaktaris (2):
      wifi: ath11k: implement CE interrupt enable/disable for AHB
      wifi: ath11k: disable interrupts during firmware crash recovery

Kamil Bienkiewicz (1):
      wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332

Kang Yang (1):
      wifi: ath12k: preserve PPDU state across monitor status buffers

Linkai Gong (1):
      wifi: ath12k: clear dangling channel pointers on error paths

Manish Dharanenthiran (1):
      mailmap: add entries for Manish Dharanenthiran

Miaoqing Pan (3):
      wifi: ath11k: fix sporadic WLAN initialization failures
      wifi: ath11k: fix NULL dereference in ahb remove when QMI init incomplete
      wifi: ath11k: unregister PM notifier on QMI init failure path

Mikhail Lobanov (1):
      wifi: ath11k: modify null check logic in ath11k_ce_rx_post_pipe()

Nicolas Escande (1):
      wifi: ath11k: fix locking problem in ath11k_dp_rx_tid_del_func()

Rameshkumar Sundaram (2):
      mailmap: add entries for Rameshkumar Sundaram
      wifi: ath12k: fix DMA unwind for ext MSDU descriptor retry

Sriram R (1):
      mailmap: add entries for Sriram R

Vasanthakumar Thiagarajan (1):
      mailmap: update email address for Vasanthakumar Thiagarajan

 .mailmap                                           |  13 +-
 .../bindings/net/wireless/qcom,ath12k-wsi.yaml     |   7 -
 drivers/net/wireless/ath/ath11k/Kconfig            |   3 +
 drivers/net/wireless/ath/ath11k/ahb.c              |  16 +-
 drivers/net/wireless/ath/ath11k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath11k/core.c             |  10 ++
 drivers/net/wireless/ath/ath11k/dp.c               |   2 +
 drivers/net/wireless/ath/ath11k/dp_rx.c            |  19 ++-
 drivers/net/wireless/ath/ath12k/ahb.c              | 166 ++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/ahb.h              |   9 ++
 drivers/net/wireless/ath/ath12k/ce.c               |   2 +-
 drivers/net/wireless/ath/ath12k/core.c             |  23 +++
 drivers/net/wireless/ath/ath12k/dp.c               |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  45 +++++-
 drivers/net/wireless/ath/ath12k/pci.c              |  55 ++++---
 drivers/net/wireless/ath/ath12k/qmi.c              |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   3 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |  23 +--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  17 ++-
 drivers/net/wireless/ath/ath12k/wifi7/hal_tx.c     |   2 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |   3 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  16 +-
 drivers/net/wireless/ath/ath9k/xmit.c              |   2 +-
 23 files changed, 346 insertions(+), 98 deletions(-)

