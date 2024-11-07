Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2E9D4336A
	for <ath11k@archiver.kernel.org>; Thu,  7 Nov 2024 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sog4b2Jn6KuFRSP9iLuGWsw17jQLWWK/2Bvs1ddxC1M=; b=XRSLRfkK0A1xHxeWNBxWZVlL0j
	TscgCpQdgAmaIH9MdTbzk3EFAZysdBZAN8Qs/b2CsPI4jvBE8tK5SfYXjVuZnKvU9lygXeNzrz+Uf
	Ew5IYDgVxTf38JQXoI71JgHothSthYPGxZFVFhgit7eQUdm8Y6xoF7D4iWGO5flrKAdAJ6z6anXbD
	934FPIrU1JOQ3lgwdqpagD+cKNHefKNBFL4fyrUE+LHzDZooFKcMVnD9eE3D3n0sHEbiBtKUi/hPI
	et733a7ZliB2y9zBe82dE2qQeuVk1WxjNdpZoDe9ErHiLm0R3ZeKAW0XHrUEsAZYM51Oga0twqTb/
	fPS6MAXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t93g8-00000007J8P-2R2k;
	Thu, 07 Nov 2024 14:40:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t93cs-00000007Iga-2d9k
	for ath11k@lists.infradead.org;
	Thu, 07 Nov 2024 14:36:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 14A8D5C0450;
	Thu,  7 Nov 2024 14:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC55C4CECC;
	Thu,  7 Nov 2024 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730990205;
	bh=lAKwN6OeXOSrc/6uLU3rAXcnpoO+ac7+oGkpACeM/jY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TsuZ+ahf3jga0XcrZ9qD1ctyPQUYfmfp80puepqJT+Tu7iat1JCDXcJ1LS3PpnQ/e
	 6UYz+rijUHM407E2iv5bt7GvxmFW0TPY5F58IzfK3luMyOvCXI9aPG+TAzrwUvQQ8q
	 UQpZbxepWy0rHGnlwjxIi0vmWLQtQ0o85yZ4MsWqWFYWc2Xw0eBjdDnLyu+PkMgSPh
	 7MgskR10RNTx33hR9ixewSf0lV/YJSwjKgbZlqrXUEjz0EGvm1oj6BzlxcIPOthkEt
	 oHnoAdBjmjgJNFLhRUto6/NwOovGmRQn63O0dFk1ZUjE7d7OYJEc2bdByqbVd1GDxr
	 LplRJT+uG8FhA==
From: Kalle Valo <kvalo@kernel.org>
To: "Yury Vostrikov" <mon@unformed.ru>
Cc: ath11k@lists.infradead.org
Subject: Re: hot busy loop inside ath11k
References: <7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com>
Date: Thu, 07 Nov 2024 16:36:42 +0200
In-Reply-To: <7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com> (Yury
	Vostrikov's message of "Fri, 01 Nov 2024 22:39:26 +0100")
Message-ID: <87a5eb5cw5.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_063647_004986_A472BD0E 
X-CRM114-Status: GOOD (  15.73  )
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

"Yury Vostrikov" <mon@unformed.ru> writes:

> Hi Kalle,
>
> It seems there is problem with busy wait inside
> ath11k_debugfs_fw_stats_request. I have a laptop with QCNFA765 WiFi
> controller. It is running vanilla v6.11.4 with the following fw:
>
>> [    3.934078] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
>> [    4.801624] ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
>> [    4.802469] ath11k_pci 0000:01:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
>
> Sometimes after device wakes up, the system becomes
> sluggish and burns CPU. A assume it is because of a firmware bug, but driver
> should not waste CPU regardless.
>
> According to perf, the most time is spent in busy waitin inside  ath11k_debugfs_fw_stats_request:
>
> 94.60%     0.00%  i3status         [kernel.kallsyms]                 [k] do_syscall_64
>         |
>          --94.60%--do_syscall_64
>                    |
>                     --94.55%--__sys_sendmsg
>                               ___sys_sendmsg
>                               ____sys_sendmsg
>                               netlink_sendmsg
>                               netlink_unicast
>                               genl_rcv
>                               netlink_rcv_skb
>                               genl_rcv_msg
>                               |
>                                --94.55%--genl_family_rcv_msg_dumpit
>                                          __netlink_dump_start
>                                          netlink_dump
>                                          genl_dumpit
>                                          nl80211_dump_station
>                                          |
>                                           --94.55%--ieee80211_dump_station
>                                                     sta_set_sinfo
>                                                     |
>                                                      --94.55%--ath11k_mac_op_sta_statistics
>                                                                ath11k_debugfs_get_fw_stats
>                                                                |
>                                                                 --94.55%--ath11k_debugfs_fw_stats_request
>                                                                           |
>                                                                           |--41.73%--_raw_spin_lock_bh
>                                                                           |
>                                                                           |--22.74%--__local_bh_enable_ip
>                                                                           |
>                                                                           |--9.22%--_raw_spin_unlock_bh
>                                                                           |
>                                                                            --6.66%--srso_alias_safe_ret
>
> If I'm reading the code correctly, then ath11k_debugfs_fw_stats_request has 3 second timeout:
>
>> timeout = jiffies + msecs_to_jiffies(3 * 1000);
>
> however, it only waits for 1 second:
>
>> time_left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
>
> the rest (2 seconds) is spent inside busy loop
>
>>	for (;;) {
>>		if (time_after(jiffies, timeout))
>>			break;
>>
>>		spin_lock_bh(&ar->data_lock);
>>		if (ar->fw_stats_done) {
>>			spin_unlock_bh(&ar->data_lock);
>>			break;
>>		}
>>		spin_unlock_bh(&ar->data_lock);
>>	}
>
>
> spinning  for 2 seconds seems excessive to me. What do you think?

Oh wow, excessive is an understatement :) That's horrible, I don't know
how we missed that. And an unlimited loop like that is a big no-no in
kernel, every loop should have a some kind of maximum limit. Can someone
send a patch?

> Also, if you happen to know how & where to report firmware bugs, I'd
> appreciate any pointers.

I recommend filing to bugzilla:

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html

Though we are overwhelmed with everything right now so don't expect a
quick response :/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

