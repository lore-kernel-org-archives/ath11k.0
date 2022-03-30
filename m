Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FD7C433EF
	for <ath11k@archiver.kernel.org>; Wed, 30 Mar 2022 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xco2I96MwLubkqgHjwSVu4zNZs0juwqIu98+WcstauU=; b=DR2Tnba/89bwno
	hU1JOQFp8PC+C4UEd5+56NOKNyNUl+hMA0T5ffkStiOAYz62d5rdB3HMzLN40rdqZ/udhJ9vsOpl3
	ELbz4XBPZL5TUWI89PMw3Ii9jqDtL+FQCb6HKdJSLFZFqp94OxKfZEhMuJFVc4orWGx0I3ZImR4yn
	BDFILsti/lvIWVfMgETlZV3FoSV2qpQq7BEYK1TdlBEP17SVBIIISNGt0QwquDf619qkClKzaGNVy
	8C+VgCPM0ozM8q/XOeNgiRAHPKpVKJxCG3UWFYJjY7hePQJGLyWXg9XvLj8yXlMClSSjju/qKgtmq
	Dl6KzT8SaTXnndAohu3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZXu3-00FvTm-MC; Wed, 30 Mar 2022 12:58:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZXjO-00Fqav-Lg
 for ath11k@lists.infradead.org; Wed, 30 Mar 2022 12:47:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B512B81C10;
 Wed, 30 Mar 2022 12:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F5AC340EC;
 Wed, 30 Mar 2022 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648644439;
 bh=ni1Ay+1vQWqfjHgr4U2zxyY4eOdz+ew5ss124sxBygE=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Gx7z6oX0BACoStMEwg5wbGX6r4qbk87i1DYA/qC1zzb35Gu9C+JFRH9UGh3xf9sin
 7YO2P56hPUicoE2aLdSnjxrxWn4yTu17lKN9jtxa74H8s4LvM6Y08YktgjRx7cIzzp
 1ba9Q+Do7aBGDSYHaLMe/UFqVpXTIO46tXZceKQ7B4smmpO/mlMjw84Awz9BvuOZmy
 vTJ1VxPro3SvfICNnMXyQK+BIzD+i47oxfEl1e+4upiUT97M7/wPK9MaJJCBJ6zyC1
 rxQeHmG3TcXFezpOdn2LShidyHfBQ2V2x2FpzW48b6Ttkxq6ocvdegYZqp8R6czXsl
 JLAENT+4TdP2g==
From: Kalle Valo <kvalo@kernel.org>
To: Mark Herbert <mark.herbert42@gmail.com>
Cc: ath11k@lists.infradead.org
Subject: Re: QCA6390 power saving issue
References: <a70aba8a-cce4-a84b-ea70-5761bde1cbe5@gmail.com>
 <87pmm3x424.fsf@kernel.org>
 <da91be76-d609-ba29-76e6-5365ea1db9d4@gmail.com>
Date: Wed, 30 Mar 2022 15:47:13 +0300
In-Reply-To: <da91be76-d609-ba29-76e6-5365ea1db9d4@gmail.com> (Mark Herbert's
 message of "Wed, 30 Mar 2022 12:43:01 +0300")
Message-ID: <87a6d7wqsu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_054722_921788_CDCF4ACA 
X-CRM114-Status: GOOD (  16.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

+ ath11k list

Mark Herbert <mark.herbert42@gmail.com> writes:

> Done - https://bugzilla.kernel.org/show_bug.cgi?id=215775

Thanks!

> Checked the previous bug - the powersave activation is done only on
> change of something - so when the driver is loaded but never connected
> so this IF did not become true at least one time - the powersave is
> not yet enabled and card remains in the initial setting keeping PC3 as
> a lowest state. Seems that when we initialize the driver we need to
> call this ath11k_mac_config_ps(ar) one time - then on each change of
> the connection the current code will handle that.
>
> @@ -2942,6 +3019,16 @@ static void ath11k_mac_op_bss_info_changed(struct ieee80211_hw
> *hw,
> ath11k_mac_txpower_recalc(ar);
> }
> + if (changed & BSS_CHANGED_PS &&
> + ar->ab->hw_params.supports_sta_ps) {
> + arvif->ps = vif->bss_conf.ps;
> +
> + ret = ath11k_mac_config_ps(ar);
> + if (ret)
> + ath11k_warn(ar->ab, "failed to setup ps on vdev %i: %d\n",
> + arvif->vdev_id, ret);
> + }

Didn't check the code, but makes sense. Can you or someone else send a
patch, please?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
