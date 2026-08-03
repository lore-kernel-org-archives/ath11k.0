Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BBEC55196
	for <ath11k@archiver.kernel.org>; Mon,  3 Aug 2026 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=; b=arARyYV77Ltz+ay70bZfUWxNig
	Lfu/2kEqANh8vWnLgKvgQLV+FDSz75CL4SF3suZCwHF1xJJW/v0ZUuYc1s8n9xa30RfAInpwoDHG9
	muHMMBKMS9bLx/w1cR4qEVuha7AmVd024v3oAF/7sZ0gNcspIRzXJBsCY1LYY+sxrMYkXlSXEsPFN
	wuaMBYBOhIi1V1EiUUoC9UOi75+MDh24jUkJM9Ay+c7knZEgFOrxFDhm6JxO5Ma2SSKBlt8/c2jlb
	9YuaV6sNbGnN5pvaABHDUQ5ujbnuH30J4US6jvr7954H0946AjsbCMVhKjdJ0PS/6eMMbg/+4PuZb
	Z50zeTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzL0-00000000VQC-0p65;
	Mon, 03 Aug 2026 20:32:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzKw-00000000VOv-2kD9
	for ath11k@lists.infradead.org;
	Mon, 03 Aug 2026 20:32:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673JkXwg1749979
	for <ath11k@lists.infradead.org>; Mon, 3 Aug 2026 20:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=awTHV+0FHJTetu7VAFUruO
	wJMsi/uWQRW6kJiJoR04s=; b=M7UU3bv8jvmuGlt360SYvXSL97ZgGhu6ieMi1t
	aclz1S9hmMS5caX8giNmy/akI3PsNwfP0lCQWC9EiUb59Q7vWwWiUnej+CukvsFU
	Ajz4Fi0NbGmR1YEZ7VIFxfBmyGip6jD8KKcrtXN7ucV6L5Dpd2dI/C5P58yhsEdE
	m3h73oWRlD+LayTt7RkROzos00sbiLErn078JI284DMr9mo2huaupdtZmlOF4Hat
	iaL/k63bBeso3m31wbyLs63p3jI9Puf+KHy1zPfLHpUGGAT11SclHBvuh45E5wAP
	x3mlXkYJvoO0kq+BMiT8i8C1MtIkV1COyMWk/pzgjRy1EUVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3r0v79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 20:32:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso4217616a91.3
        for <ath11k@lists.infradead.org>; Mon, 03 Aug 2026 13:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785789157; x=1786393957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=klVtPER06/iPGq7lW2gb2ng9CExOsfJy0EO6PDQE6XBw8ZxLFO+UTXTbdgz5Sbv0AO
         KzKaMj4k0c+jTO8/qQZJv9GSrpCmNT8AKj+xwQhXjByQMr2QvDgrtFGB6bg5OF5hrqnj
         dK1URM3H3CqqSWjhIetTl99ha7laQjyHiQmrpooVzHDcuw9jSnh22eB+1AN+eDSXwlwD
         2X8XfbmWWFbM3slTB2NqGXTG4rySD3aE0khXYhG3d9nSY0qjOaMQXOpLVflGZvgyurMp
         QY2ixI+FfjAwseklfvxH/QbeATmaCd+x4SGBzfGQILWcbDwJEoEHXfsa4uk5oU3EtxmH
         lL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785789157; x=1786393957;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=awTHV+0FHJTetu7VAFUruOwJMsi/uWQRW6kJiJoR04s=;
        b=CNAPRn0zG6oy6XQxxMToy0ktJzSRcaAvj15iZAuYqIVOtkefB8T/Fg+Oo+iWnwSJjg
         k/NX5T+XBgBxkn1C68cJj/w+/N6U1GcvWPmDEeTm031KeikqNE5Gcyfq8o0TuSKBwUSs
         S/dlkMnYPvtDrnRnLYtoudvNLSjBV8t1aLqzREpzNb+z4FOFu28pzRRTY7v71Ht0X6eV
         GNMhSzqBiqlQujBw6b433OwfeJX0s2C8gXOY00K2bThBr8fGxfdyhaho1X/eJubKRai9
         N9irOTCUA9iU5tpNpI0IW5Xzs/TOxaXwm+PwCn5ANNqFZHK6+dhF1MJruXc25xeMSCX8
         GlfA==
X-Forwarded-Encrypted: i=1; AHgh+RrBToMjhGtjeKluKfTWmlihv/WeyTpzuP8zDo7DA/cuYSPgayFRGiV3uHZ2AHoigH8bZOtDLzM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNc1fi784rPjCs9TKyneVebAyNek/HVpZUKnINHdva/47ScpgP
	5BmH6YSfSHSFqqgdR+2DLNjChQYzToRyw+txAW9NDY1efMLSMX1qjGE0dom/lgDuQNcTc/0thOW
	kQFm7Fpsnd0dmmYF2vqtm8+fMA1wArmNKIoIALNXPIgIP3AdN1v1dpp5GNxBn8rknmXKZehuR
X-Gm-Gg: AR+sD106gz2W7OyYoxTe88I7tFZYH+57nnvojqbxrZE08TaIW3KA5sFzTsyjp7tZje0
	rRnT+1pmJnriFxFZDgIOkvMJLEGvdIp5IRpQy9t/p6GHkpF8bsK+doSQRi6xfTZS4f3AkG+ueQN
	hI2mvbYJvC+uKd8c3994rd149b/uyl4guMxr/7AWWmdlDqZ4S4weX+Xz80tRWWJTTI/sX6YzrYT
	a10+Qnvnwoa+IX1OJSzPD3n6WrqlGeWD0OAi2qwAIDAX3KMAo3v8IdKssnWOtSyjgghh1y66KCr
	/2tdFOGplgGOcaZKlWaaOQmH46Hegn2rqh7fID/PlqjUZx0SQcEwf75Vg+/ha8zHe16U2ClJf/F
	tcLHkkxhcrdJdzHUhoROfRIYgbPhuxgi12qeK
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430250a91.28.1785789157421;
        Mon, 03 Aug 2026 13:32:37 -0700 (PDT)
X-Received: by 2002:a17:90b:4f48:b0:38d:c834:2106 with SMTP id 98e67ed59e1d1-38fbc4fcf95mr10430228a91.28.1785789156974;
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm37948142c88.1.2026.08.03.13.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 13:32:36 -0700 (PDT)
Message-ID: <e3d855a3-94ee-496c-98f0-efa10e0138c9@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 13:32:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260803
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=caPiaHDM c=1 sm=1 tr=0 ts=6a70fae6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=M1n47RuBD0lxbceSDO4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfX2No2RzO0T50l
 8MXF/kzsCPjn4+5WxFCWBtGdu70m19SZkcB/kVZ3ubAmawgSYW6XpijgeoCd5zDzhtOHAmxysWD
 i8EItxkw2yNJ8VaQ31xeoYJPDOhrvRo=
X-Proofpoint-GUID: bYWKB-GFxawZiggF7BBsjIx0N6c1q6T4
X-Proofpoint-ORIG-GUID: bYWKB-GFxawZiggF7BBsjIx0N6c1q6T4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE4MSBTYWx0ZWRfXyl7UuGZhrsFS
 JWz3rolkwA0voFDXMSYqrg38Jw86N5FtBTAlV04m94s6BtopgLn8FjDgHnFBQxll/hWevTmNfDs
 Ir2Tw5rdvf7p0RojudkQy3u7VirCXMtEFhsUOyq5GfKm70Nx2kkPCvNv9ogy8x/P4B+qOGgcdsT
 hDkJTNZJVxIUNvsxTaNU3oHDt+niKo0wkdBtXN+T9fiQC/PJps0rmGyFxLWuXgtvUTK/6aERhbN
 AOdjMwbWecxr1LMRhNvow7CHdlQJU2HTGnMQNSC7b5PsXjwsuRxcIn1smhSMTYXVJC/2xCAKvzL
 l1GHuRha7OwlVz6qfCjTidV2+ovj6LuDHjEoa9Tx7e3tJTnP+YErdj/tCh9MB86PGoUmVw5cDI3
 57f5OijCn7WknlE4F1juFlo1kukdIUo/Zb4qKHL1LYjE2faVDyGqc41jv8+zVFl+ng0JAP9nWcy
 ND91X0CQ0fuyR4ZvX8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_05,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_133238_769275_D127D87F 
X-CRM114-Status: GOOD (  10.93  )
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

The following changes since commit edc84a9396acf1a0e78c46230dd0bcee1b84ac53:

  Merge tag 'wireless-2026-07-26' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next (2026-07-27 16:03:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260803

for you to fetch changes up to 4f25071afe9218aaae1c63fbf75e229aa6405319:

  wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump (2026-08-01 08:50:27 -0700)

----------------------------------------------------------------
ath.git patches for v7.3 (PR #2)

For ath12k, add MultiPD support for AHB platforms. Other than that, just an
assortment of cleanups and minor bug fixes across ath6kl, ath10k, ath11k,
and ath12k.

----------------------------------------------------------------
Aaradhana Sahu (2):
      wifi: ath12k: add AHB platform descriptor support
      wifi: ath12k: Share RootPD state across UserPDs to avoid duplicate operations

Doruk Tan Ozturk (1):
      wifi: ath6kl: clamp assoc request/response lengths before subtracting IE offsets

Jeff Johnson (8):
      wifi: ath12k: fix overreads in ath12k_wmi_process_csa_switch_count_event()
      wifi: ath11k: fix overreads in ath11k_wmi_process_csa_switch_count_event()
      wifi: ath12k: validate TLV length in process_tpc_stats()
      wifi: ath12k: move firmware_mode enum to qmi.h
      wifi: ath12k: rename firmware_mode enum members to use QMI namespace
      wifi: ath12k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix stride mismatch in mac_phy_caps_parse()
      wifi: ath11k: fix leak in ath11k_service_ready_ext_event()

Linghui Wu (2):
      wifi: ath10k: filter non-UTF testmode events
      wifi: ath10k: snoc: use memcpy_fromio() for MSA ramdump

Pavankumar Nandeshwar (2):
      wifi: ath12k: Use different RX release ring sizes as per memory profiles
      wifi: ath12k: skip MLO multicast links during crash recovery in Tx path

Reshma Immaculate Rajkumar (1):
      wifi: ath12k: fix encrypted EAPOL TX in encap offload mode

Sang-Heon Jeon (1):
      wifi: ath6kl: return 0 explicitly in ath6kl_init_upload()

ZhaoJinming (1):
      wifi: ath11k: fix resource leak on error in ext IRQ setup

 drivers/net/wireless/ath/ath10k/snoc.c        |   9 +-
 drivers/net/wireless/ath/ath10k/testmode.c    |  14 ++
 drivers/net/wireless/ath/ath11k/ahb.c         |  79 +++++++---
 drivers/net/wireless/ath/ath11k/wmi.c         |  30 +++-
 drivers/net/wireless/ath/ath12k/ahb.c         | 209 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/ahb.h         |  34 ++++-
 drivers/net/wireless/ath/ath12k/core.c        |   7 +-
 drivers/net/wireless/ath/ath12k/core.h        |  11 +-
 drivers/net/wireless/ath/ath12k/dp.c          |   2 +-
 drivers/net/wireless/ath/ath12k/dp.h          |   3 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c       |  46 ++++++
 drivers/net/wireless/ath/ath12k/dp_tx.h       |   2 +
 drivers/net/wireless/ath/ath12k/hw.h          |   1 -
 drivers/net/wireless/ath/ath12k/mac.c         |   2 +-
 drivers/net/wireless/ath/ath12k/pci.c         |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c         |   8 +-
 drivers/net/wireless/ath/ath12k/qmi.h         |  14 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |  90 ++++++++---
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  64 +++++++-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c         |  32 +++-
 drivers/net/wireless/ath/ath6kl/cfg80211.c    |   5 +
 drivers/net/wireless/ath/ath6kl/init.c        |   2 +-
 23 files changed, 550 insertions(+), 120 deletions(-)

