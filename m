Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3D3CD042D
	for <ath11k@archiver.kernel.org>; Tue,  6 Jan 2026 02:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fqBVlJP8W0Ul/gyJXZHa7K8iOJjfBhqduGh/v2kAtHM=; b=xLA3vF0/Oxo5lbikV7TjphAfzO
	iQAJUKUIEloLtlNpSAlUsTLyYLhqUiNNWi41EcuUMo5k40UKbxem6xoHw4dLL5VQA5uSUp/iGszwR
	eOflEjlQfanMJg/I6pD1/XOE8zKDD0+CfsW1mHxLl2N2b2rUcRv7UCB+xi7bpIkBs0I15x8G1sa4U
	YYM8Mns313RR/duK35YlUvGb7x/YsXaTca+K//uKFA8+0KnyaiN4j9OKkA0UaCeCuciKypl55p53T
	+/JIgdygLP7XtGVrczfKef1cADRycGz5rx+2gtgY7LYhWVtVEZfOJAqCDOmx5vp2q3KiesgvR5ilS
	t58jd6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcwZN-0000000CLAj-31TR;
	Tue, 06 Jan 2026 02:13:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcwZL-0000000CL9k-0fdv
	for ath11k@lists.infradead.org;
	Tue, 06 Jan 2026 02:13:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6060nsXC2944131
	for <ath11k@lists.infradead.org>; Tue, 6 Jan 2026 02:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fqBVlJP8W0Ul/gyJXZHa7K
	8iOJjfBhqduGh/v2kAtHM=; b=bs6X94UwB2x2CjzU1MTqE7iFoxFIai7Y6nRVob
	tg7yBDZbjG4AvPmuu8czico0S6f7u+SodB5BVyGP0maIwWKxCnmuyIaq8xMXNf5W
	/JvCI/epX+cwPR6mKBS7jvxmN2IyFdgoFNiABzlaRWrdbEPOitUdlhptUeI10bw8
	fBH9ImcgNO97Z8YyZsDSRDu+nqro693DnHrskZJYj9yYsDTXaYSXfrTYH9KS63N0
	sslOvku80d5ZbhXvZO6fpoHG/NppBo56DyN8n0/GdPqDdqz1KskJd81+V/3GJfPK
	4FfAGh/lfrozmQChLqISGMI8IMOMvVBuuQIS2MktwvMcngXg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv01m64-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 06 Jan 2026 02:13:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c904a1168so1347344a91.1
        for <ath11k@lists.infradead.org>; Mon, 05 Jan 2026 18:13:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767665588; x=1768270388; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqBVlJP8W0Ul/gyJXZHa7K8iOJjfBhqduGh/v2kAtHM=;
        b=eKq9+1qm1TSF3l2dDgyBH9EPRpk552902g9fKl5WJR/a2bsck9pqY30qO4JLCpyhoV
         0gQyy1Nvn2db9bYbLPfeU1+9Y1E/5Ml2ZiOr1Fsz3YjLUA0a6y2FMja2D5fZ8/qEjOiW
         X9iYUlWvk7gDl56Gv2K5vshIRnhCJ6O1vA3lx8pNKXXEugrR8pVTFIhuFX3oVCR1rUmX
         YFU4Xnipfe8veXBfkh2KeqBCF/GxPkFrtaxlWDUIiiMBmi5oE9XW2row8gFAdFUDyhuX
         DBieZWTEPIiOc+h3cfyDorJIilGrGRgA1FtfVXjsueKUtW1U1QQMkLn+YoZjRiWPkURN
         tAoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767665588; x=1768270388;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqBVlJP8W0Ul/gyJXZHa7K8iOJjfBhqduGh/v2kAtHM=;
        b=Cb7cjyzvM0lD+j8Ro/QwAJrWcn/ZAB4ngzwQ4O5DlL/QfQeg/MWHg3vf6t4u6bMuXQ
         BfZGlvNFi6+2xJTUhhR+rJDREPBob8Lcy/QHW1+KkFcy/KexZu+y2fNujCgETcYri579
         8wXkNiU9gFZAIEvT8KVrSfnUpZQf7wgwNBPz+5ZTs96m6iaQYdAkrGu9Vuy1ufJtweGW
         gr3sYfzi0woUc1dQd6rZnh7CR7EcdWTYns2IrhyrOSFntgk54pczkYuW7OB1uy5bZZ71
         v5IiPbC/OhFN4zKOJIdBG+N/itM90x2YMHpmwbY7V5TccNGJsKcx9P9gUQl6M88Q3mvD
         3yTg==
X-Forwarded-Encrypted: i=1; AJvYcCV/2VAiGLMYpw8gqm4F7ArRVIbHZ3ied+tw8lx44uYd4Wip8BTVV8FCzskQWWjeBK4p39HAOJE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqdmPYGYKNa7EnX1/F5qSc8fZaoVuoQr9X4pNR3Q62JeDw6ckt
	x9ynCGan0Ak5YDjL/bswuRi0CmusIRtOxDOuWV26HXN2jiw+vlBsxRpfI9sGR4d6beq6sCegwEv
	A1gdX0tCS2OvOjKPovy7xPAM+BZDEl3j6sTseFuSZPYGW4aAPSepDzwpfU2pRUEj1
X-Gm-Gg: AY/fxX6+mt8yRLwDbzJ7dgQOKZ47OrV6YPEG2QHc4WCTlDqctycwQOgngz08kIijiO+
	tlX/16Xgtcho+0Fr7ux0BGdc+hb5x7ukQxPhk4wUw941ZV4Y/DwerIp1q4h64aYFPRM0tX5zRGH
	Mk9zIjlGx8enBYtzdp5tV8CWlfY6G/7TKdBETq8OeA/ig+pBkwz1vHuKL82PR+joEqCHqEQENI7
	9W+L35mgWMsx6sUOXKhLT1Ls2AuIupBFDO1PD0F6URcAjrzf3+k8S7KP7atOPhTWAREPufQwTBp
	UoxxyOy1aulYsfM3XM9GxcjRw/2iSDnCx4uu1HIcivMpuQRCE+RlRzShwFd/WNwe3IvSi9Ynh5X
	TZHygoRkl8yqawIMpJDwypsWL4dSVpm8uYPboKuRbYIjA8w==
X-Received: by 2002:a05:7022:6ba1:b0:11b:1cae:a0fa with SMTP id a92af1059eb24-121f18278e4mr1692586c88.0.1767665588199;
        Mon, 05 Jan 2026 18:13:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPLYS1SUQRcFX+9WGJoDBCE7WPO/nyvU53n8et8MAyQsi8zio7Bmzx5LEl7PwxE1A8poWzyw==
X-Received: by 2002:a05:7022:6ba1:b0:11b:1cae:a0fa with SMTP id a92af1059eb24-121f18278e4mr1692553c88.0.1767665587451;
        Mon, 05 Jan 2026 18:13:07 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm1755216c88.5.2026.01.05.18.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 18:13:07 -0800 (PST)
Message-ID: <4ba3aecf-5194-48e3-a112-31da3a8646aa@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 18:13:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260105
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695c6fb5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8
 a=hIcQITZmgDee9vmefioA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: ID_y0V9lSZg4Tmh7O6Pf9Sf0z9pAa2G1
X-Proofpoint-ORIG-GUID: ID_y0V9lSZg4Tmh7O6Pf9Sf0z9pAa2G1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAxNyBTYWx0ZWRfXxnhWxxk1J89N
 O4PaUFLBO4vgxOqFYyjz4pFPmmZOtAtKkLe6DYS2PLMlCyR6w7VG5h5gJBv5l0cC9ogojbkpV/3
 lMauZH6UBaDW98ICdXROXgHy8quiZCtbD4xn/y+Sq/KBQUovS1uEbXvYj4qcdHtxki6euiQJ86e
 +oShnaGPbecOcbmyy3l0ZzeyDDKMbaIvIgtXeqBsLGjREoh6ZhIn/3rh9cFHdaFnDbhWwkvuF6t
 Wn6m6TYsMJl4bkwaG/ZhpLopIdBm1A5gicM9AXuSyMDoR7Dlt5WJNfEESgigtEncl3YM2pPjSuU
 9I+gdL2pT35ZBMqzzIllZDBWW8j3U1JGYzBx+h/LVgUzsIjVu9qcoMDh9yQNu5a9SI8BKe+0I4a
 4iuqKUuFjvQF+8lS/BuiVkFi1kvaUY+DnqeTHa9eBl5pWPn5gqOUqrmnwMlhPMD6sSTwFHristd
 tr1OQo0LwuW1t6QVw0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_181311_197544_6A958429 
X-CRM114-Status: GOOD (  13.98  )
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

The following changes since commit c99ebb6132595b4b288a413981197eb076547c5a:

  Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-11-13 12:35:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260105

for you to fetch changes up to 631ee338f04db713ba611883f28e94157ebb68e5:

  Merge branch 'ath12k-ng' into ath-next (2025-12-15 08:55:21 -0800)

----------------------------------------------------------------
ath.git patches for v6.20

Propagate the "Next Generation" of the ath12k driver to wireless-next.

NOTE TO MAINTAINERS:
There is a conflict between this tree and the MHI tree. This conflict
has already been resolved by Stephen Rothwell in linux-next. Please
refer to his resolution comments in:

https://lore.kernel.org/all/20260105154243.7cd5d049@canb.auug.org.au/

----------------------------------------------------------------
Alok Singh (12):
      wifi: ath12k: Move monitor ring processing to Wi-Fi 7 module
      wifi: ath12k: Move monitor status processing to Wi-Fi 7 module
      wifi: ath12k: Move MPDU pop functionality to Wi-Fi 7 module
      wifi: ath12k: Move RX status TLV parsing to Wi-Fi 7 module
      wifi: ath12k: Move TX monitor functionality to Wi-Fi 7 module
      wifi: ath12k: Move HT/VHT SIG processing to Wi-Fi 7 module
      wifi: ath12k: Move HE SIG processing to Wi-Fi 7 module
      wifi: ath12k: Move EHT SIG processing to Wi-Fi 7 module
      wifi: ath12k: Move remaining SIG TLV parsing to Wi-Fi 7 module
      wifi: ath12k: Move MU user processing to Wi-Fi 7 module
      wifi: ath12k: Move MSDU END TLV processing to Wi-Fi 7 module
      wifi: ath12k: Remove Wi-Fi 7 header dependencies from common ath12k module

Baochen Qiang (2):
      wifi: ath12k: add the missing RCU lock in ath12k_dp_tx_free_txbuf()
      wifi: ath12k: move firmware stats request outside of atomic context

Harsh Kumar Bijlani (14):
      wifi: ath12k: Move HTT code in dp.h to newly introduced files
      wifi: ath12k: Move HTT Rx specific code to newly introduced files
      wifi: ath12k: Move HTT Tx specific code to newly introduced files
      wifi: ath12k: Move HTT specific code from dp.c to newly introduced files
      wifi: ath12k: Refactor ath12k_vif structure
      wifi: ath12k: Move DP related functions from peer.c to dp_peer.c file
      wifi: ath12k: Rename ath12k_peer to ath12k_dp_link_peer
      wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base
      wifi: ath12k: Move ath12k_dp_link_peer list from ath12k_base to ath12k_dp
      wifi: ath12k: Add hash table for ath12k_dp_link_peer
      wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
      wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer
      wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths
      wifi: ath12k: Move DP specific link stats to DP link peer

Jeff Johnson (1):
      Merge branch 'ath12k-ng' into ath-next

Kiran Venkatappa (13):
      wifi: ath12k: Restructure PCI code to common and Wi-Fi 7 specific logic
      wifi: ath12k: Move Copy Engine configuration to Wi-Fi 7 specific file
      wifi: ath12k: Move Wi-Fi 7 WMI configuration to dedicated file
      wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated file
      wifi: ath12k: Rename hw.c to Wi-Fi 7 specific implementation file
      wifi: ath12k: Rename ahb_hif_ops to reflect generic usage
      wifi: ath12k: Restructure ahb.c into common and Wi-Fi 7 specific modules
      wifi: ath12k: Move Wi-Fi 7 specific init routines to dedicated file
      wifi: ath12k: Move hw_init invocation to target-specific probe
      wifi: ath12k: Modularize driver into common and Wi-Fi 7 specific components
      wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* for clarity
      wifi: ath12k: Remove HAL defines from shared PCI code
      wifi: ath12k: Remove HAL define dependencies from shared AHB code

Pavankumar Nandeshwar (46):
      wifi: ath12k: Move hal_tx and hal_rx to wifi7 directory
      wifi: ath12k: Move hal_tx.h file to wifi7 directory
      wifi: ath12k: Move hal_rx.h file to wifi7 directory
      wifi: ath12k: Move HAL Rx wrapper APIs to dp_rx.h
      wifi: ath12k: Move Rx error related functions to wifi7 directory
      wifi: ath12k: Move hal_desc.h file to wifi7 directory
      wifi: ath12k: Move rx_desc.h file to wifi7 directory
      wifi: ath12k: Move rxdma ring config functions to wifi7 directory
      wifi: ath12k: Move rx error and defrag functions to wifi7 directory
      wifi: ath12k: Move regular msdu processing functions to wifi7 directory
      wifi: ath12k: Move srng processing to wifi7 directory
      wifi: ath12k: Separate arch specific part of RX APIs
      wifi: ath12k: Move arch specific REO functions to wifi7 directory
      wifi: ath12k: Move arch specific rx tid and related functions to wifi7 directory
      wifi: ath12k: Move arch specific tx APIs to wifi7 directory
      wifi: ath12k: Move ath12k_dp_tx and related APIs to wifi7 directory
      wifi: ath12k: Remove non-compact TLV support from QCN
      wifi: ath12k: Replace ops with direct calls for rxdma ring mask
      wifi: ath12k: Move hal_rx_ops callbacks to hal_ops
      wifi: ath12k: Add new infra for the rx path
      wifi: ath12k: Change the API prefixes to ath12k_wifi7 in tx/rx
      wifi: ath12k: Move srng config and hal_ops to hw specific hal files
      wifi: ath12k: Initialize desc_size through hal_init
      wifi: ath12k: Initialize hal_ops through hal_init
      wifi: ath12k: Move wbm_rbm_map to hw specific hal files
      wifi: ath12k: Move hal_params and regs to hal from hw
      wifi: ath12k: Add direct HAL pointer in ath12k_dp
      wifi: ath12k: Use hal handle instead of ab handle
      wifi: ath12k: Move HAL CE setup and SRNG related APIs to wifi7 directory
      wifi: ath12k: Move HAL SRNG shadow config and get ring id APIs to wifi7 directory
      wifi: ath12k: Move HAL CE desc related APIs to wifi7 directory
      wifi: ath12k: Move HAL CE status and set link desc addr APIs to wifi7 directory
      wifi: ath12k: Move HAL Tx, REO and link idle setup related APIs to wifi7 directory
      wifi: ath12k: Move HAL REO and Rx buf related APIs to wifi7 directory
      wifi: ath12k: Move HAL Cookie Conversion and RBM related APIs to wifi7 directory
      wifi: ath12k: Segregate the common and wifi7 specific structures
      wifi: ath12k: Remove the unused ring inits in wcn
      wifi: ath12k: Add callbacks in arch_ops for rx APIs
      wifi: ath12k: Move DP device stats to ath12k_dp
      wifi: ath12k: Add helper to free DP link peer
      wifi: ath12k: Remove the wifi7 header inclusions in common code
      wifi: ath12k: Move ath12k_dp_rx_frags_cleanup API to Wi-Fi 7
      wifi: ath12k: Move ath12k_dp_rx_get_peer_id API to Wi-Fi 7
      wifi: ath12k: Remove arch-specific HAL dependencies from common DP
      wifi: ath12k: Build all the files in wifi7 directory into ath12k_wifi7.ko
      wifi: ath12k: Use dp objects in performance critical paths

Ripan Deuri (16):
      wifi: ath12k: Move the hal APIs to hardware specific files
      wifi: ath12k: unify HAL ops naming across chips
      wifi: ath12k: Remove hal_rx_ops and merge into hal_ops
      wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
      wifi: ath12k: Support arch-specific DP device allocation
      wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
      wifi: ath12k: Add framework for hardware specific ieee80211_ops registration
      wifi: ath12k: Add framework for hardware specific DP interrupt handler
      wifi: ath12k: Refactor data path pdev struct
      wifi: ath12k: Rearrange PPDU radio stats
      wifi: ath12k: Rename hal_ops to ops
      wifi: ath12k: Drop hal_ prefix from hardware register names
      wifi: ath12k: Add lockdep warn for RCU
      wifi: ath12k: Move ieee80211_ops callback to the arch specific module
      wifi: ath12k: Replace lock/unlock with guard()
      wifi: ath12k: Skip DP peer creation for scan vdev

 drivers/net/wireless/ath/ath12k/Makefile           |    8 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |  165 +-
 drivers/net/wireless/ath/ath12k/ahb.h              |   31 +-
 drivers/net/wireless/ath/ath12k/ce.c               |  326 +-
 drivers/net/wireless/ath/ath12k/ce.h               |    7 +-
 drivers/net/wireless/ath/ath12k/cmn_defs.h         |   20 +
 drivers/net/wireless/ath/ath12k/core.c             |   75 +-
 drivers/net/wireless/ath/ath12k/core.h             |  176 +-
 drivers/net/wireless/ath/ath12k/dbring.c           |    6 +-
 drivers/net/wireless/ath/ath12k/debug.c            |    8 +-
 drivers/net/wireless/ath/ath12k/debugfs.c          |    8 +-
 .../net/wireless/ath/ath12k/debugfs_htt_stats.h    |    4 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.c      |   62 +-
 drivers/net/wireless/ath/ath12k/dp.c               |  559 +--
 drivers/net/wireless/ath/ath12k/dp.h               | 1742 ++-------
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |  106 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           | 1353 +++++++
 drivers/net/wireless/ath/ath12k/dp_htt.h           | 1546 ++++++++
 drivers/net/wireless/ath/ath12k/dp_mon.c           | 3685 +-------------------
 drivers/net/wireless/ath/ath12k/dp_mon.h           |   58 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c          |  690 ++++
 drivers/net/wireless/ath/ath12k/dp_peer.h          |  182 +
 drivers/net/wireless/ath/ath12k/dp_rx.c            | 3522 ++-----------------
 drivers/net/wireless/ath/ath12k/dp_rx.h            |  191 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c            | 1634 +--------
 drivers/net/wireless/ath/ath12k/dp_tx.h            |   39 +-
 drivers/net/wireless/ath/ath12k/hal.c              | 2088 +----------
 drivers/net/wireless/ath/ath12k/hal.h              | 1493 +++++---
 drivers/net/wireless/ath/ath12k/htc.c              |    3 +-
 drivers/net/wireless/ath/ath12k/hw.c               | 1680 ---------
 drivers/net/wireless/ath/ath12k/hw.h               |   94 +-
 drivers/net/wireless/ath/ath12k/mac.c              | 1076 +++---
 drivers/net/wireless/ath/ath12k/mac.h              |  139 +-
 drivers/net/wireless/ath/ath12k/mhi.c              |  132 +-
 drivers/net/wireless/ath/ath12k/mhi.h              |    5 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  237 +-
 drivers/net/wireless/ath/ath12k/pci.h              |   42 +-
 drivers/net/wireless/ath/ath12k/peer.c             |  453 +--
 drivers/net/wireless/ath/ath12k/peer.h             |  112 +-
 drivers/net/wireless/ath/ath12k/testmode.c         |    3 +-
 drivers/net/wireless/ath/ath12k/wifi7/Makefile     |   19 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   75 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.h        |   20 +
 drivers/net/wireless/ath/ath12k/wifi7/ce.c         |  973 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/ce.h         |   22 +
 drivers/net/wireless/ath/ath12k/wifi7/core.c       |   68 +
 drivers/net/wireless/ath/ath12k/wifi7/core.h       |   11 +
 drivers/net/wireless/ath/ath12k/wifi7/dp.c         |  181 +
 drivers/net/wireless/ath/ath12k/wifi7/dp.h         |   20 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     | 3385 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.h     |   23 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      | 2202 ++++++++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   59 +
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |  978 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h      |   16 +
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |  705 ++++
 drivers/net/wireless/ath/ath12k/wifi7/hal.h        |  564 +++
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_desc.h |  298 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    | 1032 ++++++
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |   45 +
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c   |  221 +-
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_rx.h   |  422 +--
 .../ath/ath12k/{rx_desc.h => wifi7/hal_rx_desc.h}  |   55 +-
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c   |   23 +-
 .../net/wireless/ath/ath12k/{ => wifi7}/hal_tx.h   |   30 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |  805 +++++
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   39 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  945 +++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.h         |   13 +
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c        |  138 +
 drivers/net/wireless/ath/ath12k/wifi7/mhi.h        |   11 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  191 +
 drivers/net/wireless/ath/ath12k/wifi7/pci.h        |   12 +
 drivers/net/wireless/ath/ath12k/wifi7/wmi.c        |  105 +
 drivers/net/wireless/ath/ath12k/wifi7/wmi.h        |   15 +
 drivers/net/wireless/ath/ath12k/wmi.c              |  138 +-
 drivers/net/wireless/ath/ath12k/wmi.h              |    7 +-
 drivers/net/wireless/ath/ath12k/wow.c              |    5 +-
 78 files changed, 20210 insertions(+), 17421 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.c
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_htt.h
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.c
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.h
 delete mode 100644 drivers/net/wireless/ath/ath12k/hw.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/Makefile
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/ahb.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/ahb.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/ce.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/ce.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal.h
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_desc.h (91%)
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_qcn9274.h
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.c (84%)
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_rx.h (75%)
 rename drivers/net/wireless/ath/ath12k/{rx_desc.h => wifi7/hal_rx_desc.h} (97%)
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.c (87%)
 rename drivers/net/wireless/ath/ath12k/{ => wifi7}/hal_tx.h (88%)
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hal_wcn7850.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hw.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/hw.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/mhi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/mhi.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/pci.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/pci.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/wmi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/wmi.h

