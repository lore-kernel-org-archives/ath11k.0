Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17377E6F091
	for <ath11k@archiver.kernel.org>; Fri,  1 Nov 2024 21:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qxMj+b6/bk2OpIr2jBtOTphRhyFAbK+b8F9iFrVfNQY=; b=yd/GUKbVCwUN+pULsdpFtRqoP0
	3eVOl3i5X8FsIsBykRxkC+FmXohAEZbYkUq/DFXhxiwDCGtnljzNHOZbhhWy/YL9u4Xag2UqBsU40
	JP6RDHbYSuCwoYLiyoPKha6rsGN659MPl2vWYCPDe+vAjvv0XSfoarBAnKXm+yENdno45KWdmesyk
	37t6xsxW1smgdPjMtBvabtXJdqEU0koTgSxHiuuTRnRRaWhyAMZNWZv7XWg86p1+8TN23PqRtSTBW
	NsckH7dZPSIqCWq2SEp9RV/GvgJjwE3W+P7cCSs/ADOLpzFiHb6hsBVux6SPpjGgBFSIkjcF0ooxg
	BdbVJUyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6zN6-00000008Nnh-2xwX;
	Fri, 01 Nov 2024 21:39:56 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6zN1-00000008Nn2-1zL8
	for ath11k@lists.infradead.org;
	Fri, 01 Nov 2024 21:39:54 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 703F311400F5;
	Fri,  1 Nov 2024 17:39:47 -0400 (EDT)
Received: from phl-imap-13 ([10.202.2.103])
  by phl-compute-02.internal (MEProxy); Fri, 01 Nov 2024 17:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unformed.ru; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1730497187; x=1730583587; bh=qx
	Mj+b6/bk2OpIr2jBtOTphRhyFAbK+b8F9iFrVfNQY=; b=bf63A2z7Peu+r/gTVx
	RmDOv5w9ZgU4sYVNxmKIrfJ5FDgkyTZTsb5Vl9O3ovUOk9bpVGfFXCxru38YziXr
	zXLQma8Sv7N/Cs8PEJZLLPnRAm1mH9TtWu5R4JC81T1qyUqAUAjq7QLVx5hNeQXZ
	NlY57BBX7vFBeqXaT4f3l0IuoWd9lNBayLrnMhkfcx1oU/7tBNDL9lP1fL9ZIZSv
	hvPrVNlOcWQSthAQCdJubBHdMqeUMeKrvvjWph+QYzQp5LIhpZqqMFkKkwi7DuxW
	LD9MZITjarAf/lnZMikYaegSx/2IVPLg7+p/k4tF9kRTwCjY/rduxjRnmeSp2OYk
	6JZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1730497187; x=1730583587; bh=qxMj+b6/bk2OpIr2jBtOTphRhyFA
	bK+b8F9iFrVfNQY=; b=X02h982BP8C5XK1bbGZKgmNuFd6zcREq20FnXqIIGtRl
	4KOYSFgT5wfKqgqF/GaAjyWeFicfnLoEhzwN766hG5YMd4EAlFbPSTs2NcAY+9m6
	AdpI+wGdFpQf+S9rtPOJg/r3xrbCmE5urpN4o+cOQHNPG8Nc9BJ4qtFHYJh3e6ko
	+pZgXh+y4TxtDMTf3It68Tjbb7IMgN+sVYkxtYdRId+EiC294iELPS+UJigfhkBW
	MiMdPREAiPO8RNoNA0E2B/0VF/+gQ2D618tkjzeg6bSfo3V8M2laswAGpCy5JLid
	4n9vXatN9kgJiwMKTbF6aGn104nYlFj8v3GYD2MT6g==
X-ME-Sender: <xms:okolZ3r193TWUNmjHK-xK7bc8J0ei9LytvpU4ucKcE1ICyCesRut4g>
    <xme:okolZxo9jfRbMc1YN5QTxwC2HTzOL7NTjECVCQ1arnKdQ9SBxWuIolm2dipgytnOP
    HbcujHqd1k6KXeW4Ak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekledgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkufgtgfesthejredtredttden
    ucfhrhhomhepfdgjuhhrhicugghoshhtrhhikhhovhdfuceomhhonhesuhhnfhhorhhmvg
    gurdhruheqnecuggftrfgrthhtvghrnhephfdtudeghedtkeeltdegvdehtefggffgkeet
    jefgheehvdekueeghfekfedukeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhonhesuhhnfhhorhhmvggurdhruhdpnhgspghrtghpthht
    ohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhvrghloheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghthhduudhksehlihhsthhsrdhinhhfrhgruggvrggu
    rdhorhhg
X-ME-Proxy: <xmx:okolZ0O4YNx48vGk3qBAg1ggIuh1x7wqhFEu7_LC-8FlKYVm2lUHcQ>
    <xmx:okolZ64SYvdVZ_6Sfyk-LnXZKudGvufbUNDyhvVVlRUChOyyzaSJrg>
    <xmx:okolZ24MNsoGf13Xdxo1TPMu3THHD-5DYs8jFCBwyUuOpmEcZToaSQ>
    <xmx:okolZyi7fAL2i2-OHpKDQ8L-PJunXZHPkWF1t2OyKPU3AoXsi9QkUw>
    <xmx:o0olZ8SFu61ELHHvLJ4Qp8VYv7NDpAsX2diIT4FP-u53GkEMkThCvwZE>
Feedback-ID: i2649496d:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CFA531F00072; Fri,  1 Nov 2024 17:39:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 01 Nov 2024 22:39:26 +0100
From: "Yury Vostrikov" <mon@unformed.ru>
To: "Kalle Valo" <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org
Message-Id: <7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com>
Subject: hot busy loop inside ath11k
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_143953_439762_AF4F7CA8 
X-CRM114-Status: UNSURE (   7.77  )
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

Hi Kalle,

It seems there is problem with busy wait inside
ath11k_debugfs_fw_stats_request. I have a laptop with QCNFA765 WiFi
controller. It is running vanilla v6.11.4 with the following fw:

> [    3.934078] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> [    4.801624] ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> [    4.802469] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41

Sometimes after device wakes up, the system becomes
sluggish and burns CPU. A assume it is because of a firmware bug, but driver
should not waste CPU regardless.

According to perf, the most time is spent in busy waitin inside  ath11k_debugfs_fw_stats_request:

94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
        |
         --94.60%--do_syscall_64
                   |
                    --94.55%--__sys_sendmsg
                              ___sys_sendmsg
                              ____sys_sendmsg
                              netlink_sendmsg
                              netlink_unicast
                              genl_rcv
                              netlink_rcv_skb
                              genl_rcv_msg
                              |
                               --94.55%--genl_family_rcv_msg_dumpit
                                         __netlink_dump_start
                                         netlink_dump
                                         genl_dumpit
                                         nl80211_dump_station
                                         |
                                          --94.55%--ieee80211_dump_station
                                                    sta_set_sinfo
                                                    |
                                                     --94.55%--ath11k_mac_op_sta_statistics
                                                               ath11k_debugfs_get_fw_stats
                                                               |
                                                                --94.55%--ath11k_debugfs_fw_stats_request
                                                                          |
                                                                          |--41.73%--_raw_spin_lock_bh
                                                                          |
                                                                          |--22.74%--__local_bh_enable_ip
                                                                          |
                                                                          |--9.22%--_raw_spin_unlock_bh
                                                                          |
                                                                           --6.66%--srso_alias_safe_ret

If I'm reading the code correctly, then ath11k_debugfs_fw_stats_request has 3 second timeout:

> timeout = jiffies + msecs_to_jiffies(3 * 1000);

however, it only waits for 1 second:

> time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);

the rest (2 seconds) is spent inside busy loop

>	for (;;) {
>		if (time_after(jiffies, timeout))
>			break;
>
>		spin_lock_bh(&ar->data_lock);
>		if (ar->fw_stats_done) {
>			spin_unlock_bh(&ar->data_lock);
>			break;
>		}
>		spin_unlock_bh(&ar->data_lock);
>	}


spinning  for 2 seconds seems excessive to me. What do you think?

Also, if you happen to know how & where to report firmware bugs, I'd
appreciate any pointers.

thanks

