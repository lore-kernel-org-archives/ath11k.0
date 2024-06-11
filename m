Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6330C27C65
	for <ath11k@archiver.kernel.org>; Tue, 11 Jun 2024 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3gCeQfTk5TcAJce0FcL8M27hH7lAvd2KnpcdsVitKM=; b=DDpnHP0oTl76MqWN5moOAF7jSq
	pLEpp+zWi1eu90gwgGdguJzk1WH6DBf0PWsh21yLQLScGIRNdRRDDe1Ryx1qn70MpK22v5I2gbnVm
	FwNyvL5gk0DoaUZCzK+s1v1gbmRgGFwdgspehumFR/WWAeJNPlxg43vg/M95/C4VFBZpWayuyMYPe
	fx5yEYUKxMowMpCxhUMCtVOEdNF+XQACOcfiB8w0ynK1mrwMzDs34SfxQc59idtZpM3MepOLKViiw
	6CXFbWBUwso2nfue23HOpJiekgEWZoRXXfE+tvl5uFKMgEYF30FnjsSrr6JomW9GZbwMcD59H5CCU
	YvI06ngA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Pw-00000009sR3-3z6s;
	Tue, 11 Jun 2024 18:40:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6Pq-00000009sQB-25xE
	for ath11k@lists.infradead.org;
	Tue, 11 Jun 2024 18:40:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E239E60E86;
	Tue, 11 Jun 2024 18:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC012C2BD10;
	Tue, 11 Jun 2024 18:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718131217;
	bh=xjTNil0Z8c2KFdRC6UT5suVh0Knn5BS56cRAY4d+jRA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=kWC855MmxrZtEDuowAvxiHCaXOT1uTVXJpuTsZw1Q6HhENnxjr9RDVwbPiOjRMPqI
	 2vI+whnth/Zj97IDVAJQ8EzMKtWhnds1B1uZHhWtIVb9kinD+3e/y9D+nw1EaOp+DR
	 9La6PbqTp1yLeYiOXuOvC0Q0nOL8kVnCI2QaffKCYTBw9luwdMAldb+iGfyIchhMXc
	 dgirZkpfpGLZ+nn71+kbHaQXFP8Am9/lxnhSw6Ugm0nH9eW15Z6ejkcobJOvNFBuwK
	 N2f1LpiLPlfgxzPE8fQ+WJOIzPKfOKT3ltHS7GDVOSMJbW5HI2YSgbm2Tl6RRgojA2
	 nsMLaOkmTkUJQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix RCU documentation in
 ath11k_mac_op_ipv6_changed()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240531022411.6543-1-quic_bqiang@quicinc.com>
References: <20240531022411.6543-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813121489.3564613.14982279115447611746.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:40:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_114018_843503_97CD178D 
X-CRM114-Status: GOOD (  10.65  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Current documentation on RCU in ath11k_mac_op_ipv6_changed() says:
> 
>         /* Note: read_lock_bh() calls rcu_read_lock() */
>         read_lock_bh(&idev->lock);
> 
> This is wrong because without enabling CONFIG_PREEMPT_RT
> rcu_read_lock() is not called by read_lock_bh(). The reason
> why current code works even in a CONFIG_PREEMPT_RT=n kernel
> is because atomic_notifier_call_chain() already does that for
> us, see:
> 
>         int atomic_notifier_call_chain()
>         {
>                 ...
>                 rcu_read_lock();
>                 ret = notifier_call_chain(&nh->head, val, v, -1, NULL);
>                 rcu_read_unlock();
>                 ...
>         }
> 
> and backtrace:
> 
>         ath11k_mac_op_ipv6_changed
>         ieee80211_ifa6_changed
>         notifier_call_chain
>         atomic_notifier_call_chain
> 
> So update the comment to make it correct.
> 
> This is found during code review, compile tested only.
> 
> Fixes: feafe59c8975 ("wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

53d7c99719e2 wifi: ath11k: fix RCU documentation in ath11k_mac_op_ipv6_changed()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240531022411.6543-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


