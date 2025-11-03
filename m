Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824DECCFA07
	for <ath11k@archiver.kernel.org>; Mon,  3 Nov 2025 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=; b=0ymJHW1EsyFuuf8uPDxCcDmlYM
	7HYI5XvbDBNfs16qGmwYYSzjR0PnbNgfgY6pesSDzcfIqMDdhHEweVz9lX+mMW8VsYB2RsG17E64G
	8qaiaT9T2HxuGVvRFPkeiqf+CyJCvDdMsUeBY4jZDTguvX7C3Rq2WMm20F6/7Llz/xoHvsw8fFwUH
	zKpxaGhzVwLka6R9ur/LwBqMdCwNwhH7XLEw7b1Bv7H4KG3U0SyneyovRTUkffXyWjrQ7Fbuw/MAH
	IVpVSV4mBWPXxGBSBrMYtmopo2r+hGG6uunPVOv9YpR8LsialwaO0xSCghUoXe5j9hqG2qJmEiEKU
	Z7zI949w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwPf-0000000A8Xo-1Qvl;
	Mon, 03 Nov 2025 15:24:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwPb-0000000A8Vk-0xFA
	for ath11k@lists.infradead.org;
	Mon, 03 Nov 2025 15:24:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3B7RiI2983878
	for <ath11k@lists.infradead.org>; Mon, 3 Nov 2025 15:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O4woRQI0jpUKcLl/l0yKE3
	wmuW3/I5wz2p+nBq08PBE=; b=VFBx+cYXc8mTm/lZT6D4kFPFX55ZbrmDryGiBK
	2HCSU1WxAaKJqOalF6fwVYSzExQvLq+L9ZxOTWquqSWSppFdgDgD/y57JTu14MDH
	LBkmUg2JwSZJcUlY8gU47Eh85aaqoRNi2BRmvJm+8zqxYEYjPGIefJS8VgAbQv1g
	SnmGKe+F+4vekBPw5PR8qDXlfK7I8lwGY3B95FSqakXa+HdFzPTkjKwPtXu2M98u
	l2yacHrEZ+/NyMzu/hiJfY7zlBQNkm3S76IRiA944pOnyusNAX6UUwU234hFjSAH
	fIJHM8ESnFuuGBk+W/AoyBYQ5v0upqW34DYWMXHZqugLav8w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6u8b0mpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Nov 2025 15:24:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29085106b99so53426805ad.1
        for <ath11k@lists.infradead.org>; Mon, 03 Nov 2025 07:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762183441; x=1762788241; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=;
        b=YM1ZhEPqdv9QkQ9isMb2CZxsfq8VbwBZvSN63TkDCnv+tOXuECTAdzdM/YI8qX04Ws
         AvmcRuKBGdHmXuazh9t6qtd/5Y1aQ+s7CZYu0JiGEjhd1ViayaF0VdztZSWK42s4lNBh
         GEAe5GrEgoMW3nYiQ49rhnaWCUFU3DJzTsFigoRK5CZAwkXqk9PTio8bZviWB5K4UlL0
         hxtE4vrLnB6Gc8DkssCjvtPZSaX6FmKtN+w82zaD8FTWuVkvmz42N7FpdrmArodBzMPK
         Ent87h3uUnjve4XaV1rURBiK+KUDvMIExYwlctXJuR4q0VXf+kOJ9cGUUd9+/1qpbKl+
         AQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762183441; x=1762788241;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O4woRQI0jpUKcLl/l0yKE3wmuW3/I5wz2p+nBq08PBE=;
        b=j4tHd8sgveeN0FQ4cspvk98kOO06P+BPvK0Bt90UTHmBlGCaK72Sre4wzWhw43qZdg
         E1ITZ2ui8FZ5aROzps/QUMKKp5UXSaS+7AHFUGXD7JgybdL7JfjHZ2RWrggNsSdMq/wp
         RZ8T7Po7WCwn0ij7pg1Amduye3A91r9Q/FBbrTiejkzbWB1kp8CAkYhTzQgMns8ArQ3U
         dDyDv6IkOm/ALSRFMTuVBOh+2S2kHejiCUM5DaW22WewaTcY4ZkQbocj+VSWb3ctSAOH
         1cNVmEJbOjaZ2/0KviFt56/2kKopLP4auzlIbPfCoDt1b2ZUOUumtAMpihTjINTyN8ty
         sV7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVc7OX/RSJuAN7eoEVCf458IYUx9CZ6ndPZXccB0wW9SI/2thhimW49UoFAFq3XIbsBIbF2evI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfavoWVQ9YNxVTvAsX7zg890orljuyHBb0CxqFVbnPzFasin6r
	cLFmKsMTvIgTy6PpOdlgA8QRAt8WvpATxGX877xSsyxdaGhnB/U8fR9DC6KaRWWREqnRFEJlpkv
	m8ER4oBeYwxg/46WesnnW6qIrEVNhGGuCnebfxuglZRidpuZl1iPPmrzOihZXRL5q
X-Gm-Gg: ASbGnct31goLBFBZI+kuNOIiALCjttdKeAy7dInqFkSFu3eP9YWZVfwUme4+YCXNrKQ
	zuQyoUoFnuDNpgqF6DDFQc8irm/3RsgEMcm1yG5NAxgkbyHFYrSwD1kuPEM3ne+PhJkwQOyKDQI
	RF/u7Bg7i5Q5UXd39tTpQq/9xPIgfAUhSZUzH8VgKAJegX2udz9C/fyVmdxcJYU4d0TLUgTPcpG
	MIovKvGmyl2S4b68hAW/yb6OgkCFC8vG9AsvjhCR3vtCTzh7MUDiZhafrwW8L2XLy6hNJC7Vs6s
	Jatd51PAAzACAdK2pnoJk17nPwA8DJr4D9ZmFSgqiCTsU29NOKDeTRFd355xb/bq7tVZsjz1cQw
	BfrFOHUtnZuiq4aLUvi0DftR+ndWAUA3PlqM=
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2951a36e6f8mr196389165ad.11.1762183441188;
        Mon, 03 Nov 2025 07:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE81KX5Dw/Ser8slGU94o0wfgS7d8oR2J9GcPMTjt9tMgbij5CwCOQwqqb6pSnep8GEANLVTA==
X-Received: by 2002:a17:903:1ce:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2951a36e6f8mr196388845ad.11.1762183440630;
        Mon, 03 Nov 2025 07:24:00 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29530aac357sm117914315ad.86.2025.11.03.07.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 07:24:00 -0800 (PST)
Message-ID: <30db167b-0ebb-40f3-8beb-e3966a4922f0@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 07:23:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20251103
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDEzOSBTYWx0ZWRfX/Tn+kiQGqR3a
 uKLiR/mojKoLm/jVBjP7dx5RcPqnruGFaujwfYNCNRucMPxUq8NzBuqZufYGPMFMg79S+6/lqFR
 h5iQa7joWre8BvlXw3firf0hFkbZXw2XbgemX3rsPJNNZR3foPIKotZp5U3HaSYXitHq//sNAuI
 I7YsJWoNZpNAjc5k+SENYNrZVUXmv/nBdQC+hil2PMqPg3kT0gsEIi4/QRdTA69y8GEuBTJfNhx
 KwOvWBSwYrFp/u2zU4ueAI4ajQzUCPB2PCTVE7iutibvoAfqsX/T/iEHVHfnMZdbtpygHEBDHl4
 nCGL8xudSgiUCN5nO63z6fJ6k+fVQqE0opH3i5jLp0eYfyk6Quxpl8Hc/jTWTs8pS3GrMJqBCLb
 Mn8LDfvCvGyxX+mNrNlEnlKKN6B01Q==
X-Proofpoint-GUID: ejuMtpepJuy6VwnyyykA64hQckt0Ym4x
X-Authority-Analysis: v=2.4 cv=Ha8ZjyE8 c=1 sm=1 tr=0 ts=6908c912 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=NlKQ8RDDprgilyjO-nkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ejuMtpepJuy6VwnyyykA64hQckt0Ym4x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_02,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_072403_379863_3E3D7D0A 
X-CRM114-Status: GOOD (  13.77  )
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

The following changes since commit 94aced6ed9e2630bae0b5631e384a5302c4b6783:

  Merge tag 'wireless-next-2025-09-25' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2025-09-26 14:27:28 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20251103

for you to fetch changes up to 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08:

  wifi: ath10k: use = {} to initialize bmi_target_info instead of memset (2025-10-30 14:55:08 -0700)

----------------------------------------------------------------
ath.git patches for v6.19

Highlights for some specific drivers include:

ath10k:
Add support for Factory Test TLV commands

ath11k:
Add support for Tx Power insertion

ath12k:
Add support for BSS color change

And of course there is the usual set of cleanups and bug fixes across
the entire family of "ath" drivers.

We do expect to have one more pull request before the v6.19 merge
window to pull in the refactored ath12k driver from the ath12k-ng
branch.

---

Note to maintainers:

There is a trivial conflict between two patches:

From ath-current => wireless => net
9222582ec524 ("Revert "wifi: ath12k: Fix missing station power save configuration"")

From ath-next => wireless-next => net-next
6917e268c433 ("wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon")

The resolution is to take both hunks, ordering them in reverse xmas tree style.

----------------------------------------------------------------
Abdun Nihaal (1):
      wifi: ath12k: fix potential memory leak in ath12k_wow_arp_ns_offload()

Aditya Kumar Singh (5):
      wifi: ath12k: Defer vdev bring-up until CSA finalize to avoid stale beacon
      wifi: ath11k: relocate some Tx power related functions in mac.c
      wifi: ath11k: wrap ath11k_mac_op_get_txpower() with lock-aware internal helper
      wifi: ath11k: add support for Tx Power insertion in RRM action frame
      wifi: ath11k: advertise NL80211_FEATURE_TX_POWER_INSERTION

Baochen Qiang (7):
      wifi: ath11k: restore register window after global reset
      wifi: ath12k: fix VHT MCS assignment
      wifi: ath11k: fix VHT MCS assignment
      wifi: ath11k: fix peer HE MCS assignment
      wifi: ath12k: restore register window after global reset
      wifi: ath12k: fix reusing m3 memory
      wifi: ath12k: fix error handling in creating hardware group

Dr. David Alan Gilbert (1):
      wifi: wcn36xx: Remove unused wcn36xx_smd_update_scan_params

Jeff Johnson (3):
      wifi: ath11k: Remove struct wmi_bcn_send_from_host_cmd
      wifi: ath12k: Remove struct wmi_bcn_send_from_host_cmd
      wifi: ath11k: Correctly use "ab" macro parameter

Kang Yang (1):
      wifi: ath10k: move recovery check logic into a new work

Loic Poulain (1):
      wifi: ath10k: Support for FTM TLV test commands

Muna Sinada (6):
      wifi: ath12k: generalize GI and LTF fixed rate functions
      wifi: ath12k: add EHT rate handling to existing set rate functions
      wifi: ath12k: Add EHT MCS/NSS rates to Peer Assoc
      wifi: ath12k: Add EHT fixed GI/LTF
      wifi: ath12k: add EHT rates to ath12k_mac_op_set_bitrate_mask()
      wifi: ath12k: Set EHT fixed rates for associated STAs

Pradeep Kumar Chitrapu (1):
      wifi: ath12k: fix TX and RX MCS rate configurations in HE mode

Rameshkumar Sundaram (2):
      wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
      wifi: ath12k: unassign arvif on scan vdev create failure

Sarika Sharma (3):
      wifi: ath12k: Fix MSDU buffer types handling in RX error path
      wifi: ath12k: track dropped MSDU buffer type packets in REO exception ring
      wifi: ath12k: Assert base_lock is held before allocating REO update element

Takashi Iwai (1):
      wifi: ath12k: Add MODULE_FIRMWARE() entries

Thiraviyam Mariyappan (1):
      wifi: ath12k: Fix NSS value update in ext_rx_stats

Wei Zhang (1):
      wifi: ath12k: add support for BSS color change

Zhongqiu Han (2):
      wifi: ath10k: use = {} to initialize pm_qos_request instead of memset
      wifi: ath10k: use = {} to initialize bmi_target_info instead of memset

 drivers/net/wireless/ath/ath10k/core.c       |  28 +-
 drivers/net/wireless/ath/ath10k/core.h       |   6 +-
 drivers/net/wireless/ath/ath10k/mac.c        |   2 +-
 drivers/net/wireless/ath/ath10k/testmode.c   | 253 +++++++--
 drivers/net/wireless/ath/ath10k/testmode_i.h |  15 +
 drivers/net/wireless/ath/ath10k/wmi.h        |  19 +-
 drivers/net/wireless/ath/ath11k/hal.h        |  38 +-
 drivers/net/wireless/ath/ath11k/mac.c        | 455 +++++++++++-----
 drivers/net/wireless/ath/ath11k/pci.c        |  20 +-
 drivers/net/wireless/ath/ath11k/pci.h        |  18 +-
 drivers/net/wireless/ath/ath11k/wmi.c        |  20 +-
 drivers/net/wireless/ath/ath11k/wmi.h        |  18 +-
 drivers/net/wireless/ath/ath12k/core.c       |  22 +-
 drivers/net/wireless/ath/ath12k/core.h       |   3 +
 drivers/net/wireless/ath/ath12k/debugfs.c    |   5 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c     |  19 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c      |  74 ++-
 drivers/net/wireless/ath/ath12k/hal_rx.c     |  10 +-
 drivers/net/wireless/ath/ath12k/mac.c        | 755 ++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h        |  14 +-
 drivers/net/wireless/ath/ath12k/pci.c        |  24 +-
 drivers/net/wireless/ath/ath12k/qmi.c        |  11 +-
 drivers/net/wireless/ath/ath12k/qmi.h        |   5 +-
 drivers/net/wireless/ath/ath12k/wmi.c        |  86 ++-
 drivers/net/wireless/ath/ath12k/wmi.h        |  55 +-
 drivers/net/wireless/ath/ath12k/wow.c        |   1 +
 drivers/net/wireless/ath/wcn36xx/hal.h       |  74 ---
 drivers/net/wireless/ath/wcn36xx/smd.c       |  60 ---
 drivers/net/wireless/ath/wcn36xx/smd.h       |   1 -
 29 files changed, 1554 insertions(+), 557 deletions(-)

