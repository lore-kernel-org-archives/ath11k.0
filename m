Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9349C369CF
	for <ath11k@archiver.kernel.org>; Fri, 18 Apr 2025 16:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTdZTPYGUPh92pmkRnB/pOyLG6xVOerKX3aJH472p9k=; b=pX88FYSZEdgVW2KyRMuoU0ekzI
	ejaUdVRaJTNr10zldMkoyVjB7S8L7bwL94epElrm0KU92guCgihbb0ai5Jf0btuLkY7fYejE2LkTp
	P+QbenCO703GFvmvRqv/lddEiOQPft0lMif7igDjoJhnNqLdR/dDC+ThRHTBrKXn6BhnObTebBsm8
	paAbPjUe5Q9hZhslAqpXLn+CoaprzZzjDBsRY7Y64J21rkiIzJgRcZp0uKSaqOS7GIuzTHtTjS35o
	v8V31gGXWAZdD/es0q1/wJkTh9dWfJN/2Nhm3MFTR4EsGZgARyPpspj66Zy015mUyiCqaBcZq+mYw
	oZ1h4t7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5ob0-0000000Gwiq-3lsc;
	Fri, 18 Apr 2025 16:29:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oaz-0000000GwhL-0KIh
	for ath11k@lists.infradead.org;
	Fri, 18 Apr 2025 16:29:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2STrx015936
	for <ath11k@lists.infradead.org>; Fri, 18 Apr 2025 16:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MTdZTPYGUPh92pmkRnB/pO
	yLG6xVOerKX3aJH472p9k=; b=jKY4xxcJtvnEC3SuPGUyTTMCz4Rzy8ZyVB5MLz
	hfD7sDhvgLkqDtlr3FWjVUcBuKaju2BvNNgXECm2WHhzeijRNfVjCuvDPIwyzdou
	hxX5ZZP56lCjgQgTNlR09nDucl8XY0i97mNNoTfsVwYpu6PlIoaJYeogPlTBZQ5A
	a31rpppS1/PHqDo8isOzdY6onbpMlVse068uHi4isBQvr7/VtpurZ5z1TfggBbeT
	6Gc4DqWQlXNP3XpRtZHG+HYEQXvyP0ggrAf6qhWyha1jclM665bESv4iMkXj7T81
	bz/B2yWIk327XeZZvUf2QXj4V27hxWw3JVpVzf2Ke9nXp6HQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqjmve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 18 Apr 2025 16:29:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224191d9228so26392785ad.3
        for <ath11k@lists.infradead.org>; Fri, 18 Apr 2025 09:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993778; x=1745598578;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MTdZTPYGUPh92pmkRnB/pOyLG6xVOerKX3aJH472p9k=;
        b=LDEyfu47vfbsKas4O7p8oZVQoiEsmemZxkvtZA+ZgJqBmc113FcpC+JSazIJMZ2k+Q
         6sc72tj7MPYXYmcwhdgRtQDE89ryr49+y4wmJZ8HS5XTLeL74GjvWWT9M/jY538JxtrN
         Wv91ln39LBG3SJgULfeux0I1QrRaqTPupxkCDziyxBhS6WygISY8OmClUwVQITBm+hM5
         dF7wTUXWGSARp5I/r2v7EPh9Z6aWDTzo/T7vEbIKbJoR/RYfv3oHghLHuPKgMOjeKtcC
         USnTr3Me0/uck+rKmNAwmAuRIuslg1DzLjaN7ah2CJoHw6FXe0zuqW+AhMm6FMUy1qpD
         WnPg==
X-Forwarded-Encrypted: i=1; AJvYcCXoACHTH9/yTDqrWR9VGbV9aAAooq5QaNTYRYkdqE+wkwmzp2E5O5i06zklg3NmJc3cCuF0icY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyM4U9J9pNxjKOj3OSiQ9qm2510kV43IVy/5Ce+9Q/xe/BqbJi
	dntrNWA2xuY9fTALjaX+Zd0nWNcARIBL5hCEO5I6LabsXL9ZllzdD4zrKrHVNsKMNFVW5NpJI/6
	OAL5/XWsRfr84jGEYf5u+ock1MqVm0pdw1kOg26Cplvi2Fr756o0uvW1pGSQE
X-Gm-Gg: ASbGncsypCoALq6o3C0xmMv3N+Ztb8X0HZRxNHzVo3zlTUF3qIahCewyfiVb1fJgL9q
	OLrs27CDR4ouy5g+Q5zNN4n95LRZetCXldKXMb1y1Vob5hrxmTjSSkv9weL7fe69XPhE9MBEIU4
	142E3/ayP7B71tQapiSlOl2FsHswvWnJSOaGrLhzQPStWjqb7L9hSRPAfc3GoKPyK8E+rHGcP4r
	2Qs0fwLqrNnD+tL8M51rHhdHC9W5sOCuWNHZBlOgNz99tjSxJwOtiqgbzLTIlVMB9dq/wtjRLNc
	1vVqTGDsATObKZAGL9cX7/2q3n1QXgzWQQINQPsv1to6s/Ss
X-Received: by 2002:a17:902:f78f:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22c535acabcmr57656695ad.28.1744993778167;
        Fri, 18 Apr 2025 09:29:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7xP/p3ScqTpSBi9rFSEGVtq2mWlKvCvkbjzqi4cnmkUyIoP1GGQ/nNhKKmzGV5SwWyg7X2A==
X-Received: by 2002:a17:902:f78f:b0:227:ac2a:2472 with SMTP id d9443c01a7336-22c535acabcmr57656455ad.28.1744993777784;
        Fri, 18 Apr 2025 09:29:37 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde74fsm18663665ad.220.2025.04.18.09.29.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:29:37 -0700 (PDT)
Message-ID: <2756308f-19db-4e0d-af90-7c5cbd318c71@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 09:29:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20250418
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kELbtQ1u_fS4G_j0ktTRsw03yZ2HfDek
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=68027df3 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=JXak7ymiNV46xqQ7SLsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: kELbtQ1u_fS4G_j0ktTRsw03yZ2HfDek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_06,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_092941_267352_E707E769 
X-CRM114-Status: GOOD (  14.91  )
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

The following changes since commit 0e28ee106c46c95eb322833c17c33e3c231ccd0d:

  Merge tag 'ath-next-20250305' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2025-03-07 09:19:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20250418

for you to fetch changes up to 75f90ba47b2cda7de7a7bc1d099172516f6f96fa:

  wifi: wcn36xx: Don't use %pK through printk (2025-04-17 15:49:35 -0700)

----------------------------------------------------------------
ath.git patches for v6.16

ath12k:
Enable AHB support for IPQ5332.
Add monitor interface support to QCN9274.
Add MLO support to WCN7850.
Add 802.11d scan offload support to WCN7850.

ath11k:
Restore hibernation support

In addition, perform the usual set of bug fixes and cleanups across
all supported drivers.

----------------------------------------------------------------
Aaradhana Sahu (2):
      wifi: ath12k: Resolve multicast packet drop by populating key_cipher in ath12k_install_key()
      wifi: ath12k: Introduce check against zero for ahvif->key_cipher in ath12k_mac_op_tx()

Aditya Kumar Singh (13):
      wifi: ath12k: move firmware stats out of debugfs
      wifi: ath12k: add get_txpower mac ops
      wifi: ath12k: fix SLUB BUG - Object already free in ath12k_reg_free()
      wifi: ath12k: add reference counting for core attachment to hardware group
      wifi: ath12k: fix failed to set mhi state error during reboot with hardware grouping
      wifi: ath12k: fix ATH12K_FLAG_REGISTERED flag handling
      wifi: ath12k: fix firmware assert during reboot with hardware grouping
      wifi: ath12k: fix ath12k_core_pre_reconfigure_recovery() with grouping
      wifi: ath12k: handle ath12k_core_restart() with hardware grouping
      wifi: ath12k: handle ath12k_core_reset() with hardware grouping
      wifi: ath12k: reset MLO global memory during recovery
      wifi: ath12k: Fix frequency range in driver
      wifi: ath12k: Update frequency range if reg rules changes

Balamurugan Mahalingam (1):
      wifi: ath12k: Add support for link specific datapath stats

Balamurugan S (7):
      wifi: ath12k: fix incorrect CE addresses
      wifi: ath12k: add ath12k_hw_params for IPQ5332
      wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
      wifi: ath12k: Add hw_params to remap CE register space for IPQ5332
      wifi: ath12k: add AHB driver support for IPQ5332
      wifi: ath12k: enable ath12k AHB support
      wifi: ath12k: Add support to clear qdesc array in REO cache

Baochen Qiang (16):
      wifi: ath12k: don't put ieee80211_chanctx_conf struct in ath12k_link_vif
      wifi: ath11k: determine PM policy based on machine model
      wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
      wifi: ath11k: refactor ath11k_core_suspend/_resume()
      wifi: ath11k: support non-WoWLAN mode suspend as well
      wifi: ath11k: choose default PM policy for hibernation
      Reapply "wifi: ath11k: restore country code during resume"
      wifi: ath12k: introduce ath12k_fw_feature_supported()
      wifi: ath12k: use fw_features only when it is valid
      wifi: ath12k: support MLO as well if single_chip_mlo_support flag is set
      wifi: ath12k: identify assoc link vif in station mode
      wifi: ath12k: make assoc link associate first
      wifi: ath12k: group REO queue buffer parameters together
      wifi: ath12k: alloc REO queue per station
      wifi: ath12k: don't skip non-primary links for WCN7850
      wifi: ath12k: support 2 channels for single pdev device

Dan Carpenter (2):
      wifi: ath12k: Fix a couple NULL vs IS_ERR() bugs
      wifi: ath12k: Fix buffer overflow in debugfs

Hari Chandrakanthan (1):
      wifi: ath12k: fix link valid field initialization in the monitor Rx

Jeff Johnson (2):
      wifi: ath12k: Fix misspelling "upto" in dp.c
      wifi: ath12k: ahb: Replace del_timer_sync() with timer_delete_sync()

Johan Hovold (1):
      wifi: ath12k: extend dma mask to 36 bits

Karthikeyan Periyasamy (4):
      wifi: ath12k: Replace band define G with GHZ where appropriate
      wifi: ath12k: fix NULL access in assign channel context handler
      wifi: ath12k: Refactor the monitor channel context procedure
      wifi: ath12k: Move to NO_VIRTUAL monitor

Kees Cook (1):
      wifi: carl9170: Add __nonstring annotations for unterminated strings

Maharaja Kennadyrajan (3):
      wifi: ath12k: Fix spelling errors in mac.c file
      wifi: ath12k: Prevent sending WMI commands to firmware during firmware crash
      wifi: ath12k: fix node corruption in ar->arvifs list

Muna Sinada (1):
      wifi: ath12k: remove open parenthesis

Nithyanantham Paramasivam (1):
      wifi: ath12k: Enable REO queue lookup table feature on QCN9274

P Praneesh (17):
      wifi: ath12k: refactor ath12k_hw_regs structure
      wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
      wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
      wifi: ath12k: change the status update in the monitor Rx
      wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
      wifi: ath12k: add monitor interface support on QCN9274
      wifi: ath12k: Fix memory leak during vdev_id mismatch
      wifi: ath12k: Fix memory corruption during MLO multicast tx
      wifi: ath12k: Fix invalid memory access while forming 802.11 header
      wifi: ath12k: add rx_info to capture required field from rx descriptor
      wifi: ath12k: replace the usage of rx desc with rx_info
      wifi: ath12k: Handle error cases during extended skb allocation
      wifi: ath12k: Refactor tx descriptor handling in tx completion handler
      wifi: ath12k: Fix memory leak during extended skb allocation
      wifi: ath12k: Use skb->len for dma_unmap_single() length parameter
      wifi: ath12k: Add MSDU length validation for TKIP MIC error
      wifi: ath12k: Avoid allocating rx_stats when ext_rx_stats is disabled

Pradeep Kumar Chitrapu (1):
      wifi: ath12k: Fix incorrect rates sent to firmware

Raj Kumar Bhagat (3):
      dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
      wifi: ath12k: add support for fixed QMI firmware memory
      wifi: ath12k: fix cleanup path after mhi init

Rajat Soni (1):
      wifi: ath12k: Add helper function ath12k_mac_update_freq_range()

Ramasamy Kaliappan (1):
      wifi: ath12k: Fix the QoS control field offset to build QoS header

Rameshkumar Sundaram (2):
      wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
      wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()

Ramya Gnanasekar (1):
      wifi: ath12k: Fix WMI tag for EHT rate in peer assoc

Rob Herring (Arm) (1):
      wifi: ath11k: Use of_property_present() to test property presence

Sarika Sharma (3):
      wifi: ath12k: using msdu end descriptor to check for rx multicast packets
      wifi: ath12k: correctly handle mcast packets for clients
      wifi: ath12k: fix invalid access to memory

Sidhanta Sahu (1):
      wifi: ath12k: Fix memory leak due to multiple rx_stats allocation

Sowmiya Sree Elavalagan (4):
      wifi: ath12k: Power up root PD
      wifi: ath12k: Register various userPD interrupts and save SMEM entries
      wifi: ath12k: Power up userPD
      wifi: ath12k: Power down userPD

Sriram R (2):
      wifi: ath12k: Pass correct values of center freq1 and center freq2 for 320 MHz
      wifi: ath12k: Fix the enabling of REO queue lookup table feature

Stone Zhang (1):
      wifi: ath11k: fix node corruption in ar->arvifs list

Suraj P Kizhakkethil (1):
      wifi: ath12k: Pass correct values of center freq1 and center freq2 for 160 MHz

Thomas Weißschuh (4):
      wifi: ath10k: Don't use %pK through printk
      wifi: ath11k: Don't use %pK through printk
      wifi: ath12k: Don't use %pK through printk
      wifi: wcn36xx: Don't use %pK through printk

Thomas Wu (1):
      wifi: ath12k: Disable broadcast TWT feature in HE MAC capabilities

Wen Gong (5):
      wifi: ath12k: add configure country code for WCN7850
      wifi: ath12k: use correct WMI command to set country code for WCN7850
      wifi: ath12k: add 11d scan offload support
      wifi: ath12k: store and send country code to firmware after recovery
      wifi: ath12k: avoid deadlock during regulatory update in ath12k_regd_update()

 .../bindings/net/wireless/qcom,ipq5332-wifi.yaml   |  315 ++++++
 drivers/net/wireless/ath/ath10k/ahb.c              |    2 +-
 drivers/net/wireless/ath/ath10k/bmi.c              |    6 +-
 drivers/net/wireless/ath/ath10k/ce.c               |    4 +-
 drivers/net/wireless/ath/ath10k/core.c             |    4 +-
 drivers/net/wireless/ath/ath10k/htc.c              |    6 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |    2 +-
 drivers/net/wireless/ath/ath10k/mac.c              |   22 +-
 drivers/net/wireless/ath/ath10k/pci.c              |    2 +-
 drivers/net/wireless/ath/ath10k/testmode.c         |    4 +-
 drivers/net/wireless/ath/ath10k/txrx.c             |    2 +-
 drivers/net/wireless/ath/ath10k/usb.c              |    4 +-
 drivers/net/wireless/ath/ath10k/wmi.c              |    4 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |    4 +-
 drivers/net/wireless/ath/ath11k/core.c             |  302 ++++-
 drivers/net/wireless/ath/ath11k/core.h             |   16 +
 drivers/net/wireless/ath/ath11k/hif.h              |   14 +-
 drivers/net/wireless/ath/ath11k/mhi.c              |   14 +-
 drivers/net/wireless/ath/ath11k/mhi.h              |    4 +-
 drivers/net/wireless/ath/ath11k/pci.c              |   50 +-
 drivers/net/wireless/ath/ath11k/qmi.c              |    4 +-
 drivers/net/wireless/ath/ath11k/testmode.c         |    2 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |    8 +
 drivers/net/wireless/ath/ath12k/Makefile           |    1 +
 drivers/net/wireless/ath/ath12k/ahb.c              | 1156 ++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/ahb.h              |   80 ++
 drivers/net/wireless/ath/ath12k/ce.c               |   92 +-
 drivers/net/wireless/ath/ath12k/ce.h               |   18 +-
 drivers/net/wireless/ath/ath12k/core.c             |  292 ++++-
 drivers/net/wireless/ath/ath12k/core.h             |   97 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |  234 ++--
 drivers/net/wireless/ath/ath12k/debugfs.h          |   12 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.c    |    3 +
 drivers/net/wireless/ath/ath12k/dp.c               |   88 +-
 drivers/net/wireless/ath/ath12k/dp.h               |   25 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c           |  377 +++++--
 drivers/net/wireless/ath/ath12k/dp_mon.h           |    5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |  424 ++++---
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   33 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c            |  145 ++-
 drivers/net/wireless/ath/ath12k/dp_tx.h            |    3 +-
 drivers/net/wireless/ath/ath12k/fw.c               |    9 +-
 drivers/net/wireless/ath/ath12k/fw.h               |    3 +-
 drivers/net/wireless/ath/ath12k/hal.c              |  111 +-
 drivers/net/wireless/ath/ath12k/hal.h              |   76 +-
 drivers/net/wireless/ath/ath12k/hal_desc.h         |    6 +-
 drivers/net/wireless/ath/ath12k/hal_rx.c           |   19 +-
 drivers/net/wireless/ath/ath12k/hal_rx.h           |   15 +-
 drivers/net/wireless/ath/ath12k/hw.c               |  499 ++++++++-
 drivers/net/wireless/ath/ath12k/hw.h               |   29 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  795 +++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h              |   13 +
 drivers/net/wireless/ath/ath12k/mhi.c              |    9 +-
 drivers/net/wireless/ath/ath12k/pci.c              |   58 +-
 drivers/net/wireless/ath/ath12k/pci.h              |    5 +-
 drivers/net/wireless/ath/ath12k/peer.c             |    5 +-
 drivers/net/wireless/ath/ath12k/peer.h             |    3 +-
 drivers/net/wireless/ath/ath12k/qmi.c              |  238 +++-
 drivers/net/wireless/ath/ath12k/qmi.h              |    5 +-
 drivers/net/wireless/ath/ath12k/reg.c              |  177 ++-
 drivers/net/wireless/ath/ath12k/reg.h              |    2 +-
 drivers/net/wireless/ath/ath12k/testmode.c         |    4 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |  327 +++++-
 drivers/net/wireless/ath/ath12k/wmi.h              |   55 +-
 drivers/net/wireless/ath/carl9170/fw.c             |    2 +-
 drivers/net/wireless/ath/wcn36xx/testmode.c        |    2 +-
 66 files changed, 5280 insertions(+), 1067 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,ipq5332-wifi.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/ahb.h

