Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1983C4332F
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 16:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sv7KL/SAkh9QuozE07G5Q8n/Errm2zWLO/++907ihXc=; b=OwGppyBrGRIKJd
	BmHscNGJ0RPB/FYarI2/ZMAeYmTYkNID5oUSmOUDTX7i93Wt2T/6+VYk3gT6fwlTQkcfq62bKVVjl
	8PN7qb4M7rXgBlzya35y+HVmZwZ8o05zhpZhGOGUhsuASY9VP8NI8mgutB50xg4Dz4foKa80yDFYo
	vn3lUP6aHiY/SelErJB/H96tnXV8gCqbCQ7vXsJKgsMZKKg6nB4cDreez9MvDoWHG59rKq4d+QJda
	ZdrTV9Rw6I30c/Y//Y33oSWzamubYvOCXUJJv1PnUOr3N6t+3XA/3cVRMiJvglSH2VGrxe0xENdWh
	IBCASNYSpZ2ZRYi/J3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGyS-00CHfZ-So; Wed, 02 Nov 2022 16:52:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGyP-00CHd8-D7
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 16:52:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C7C9AB821A5;
	Wed,  2 Nov 2022 16:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0CEC433C1;
	Wed,  2 Nov 2022 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667407934;
	bh=sXtRjTK2mDtmiAA5R3kBj+6rdwU5KpPOdCfNoWca9qg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bm6Ph2CbSZpLId2m08s1AGZXc4Zv+INVO7HhiiZYyEYMffFnQbBawkP61O/kUkbmb
	 ed0G0bsu+zDggK2zemJQ/n6ByOFeJvbapQxpIF+5lm9+TveK9teTFgwD3vrvLRvGRQ
	 AYEQbw6oQNDQHNDGeSsXG33kmrL1NJhXDDDdxkDepZRsR9aqkpi93iyaOx6s7bWPQN
	 Uvl7Pf+zJRGKU7scYv3KOa0k/b1/zbEAqjOsNnqBhi6U4MdAE5HhkuweZ2wTmA4cFS
	 weMe2iCOn+PlPTYIolsTU+KuFj5DpBb6Do36f3ryY/vL5bWcK3RKS0FG3Sx46Uol6q
	 Vpd+qI+w73xrg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k (gcc13): synchronize
 ath11k_mac_he_gi_to_nl80211_he_gi()'s return type
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221031114341.10377-1-jirislaby@kernel.org>
References: <20221031114341.10377-1-jirislaby@kernel.org>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Martin Liska <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166740792692.20386.4779272467939559487.kvalo@kernel.org>
Date: Wed,  2 Nov 2022 16:52:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_095217_616330_051F49D6 
X-CRM114-Status: GOOD (  10.04  )
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

"Jiri Slaby (SUSE)" <jirislaby@kernel.org> wrote:

> ath11k_mac_he_gi_to_nl80211_he_gi() generates a valid warning with gcc-13:
>   drivers/net/wireless/ath/ath11k/mac.c:321:20: error: conflicting types for 'ath11k_mac_he_gi_to_nl80211_he_gi' due to enum/integer mismatch; have 'enum nl80211_he_gi(u8)'
>   drivers/net/wireless/ath/ath11k/mac.h:166:5: note: previous declaration of 'ath11k_mac_he_gi_to_nl80211_he_gi' with type 'u32(u8)'
> 
> I.e. the type of the return value ath11k_mac_he_gi_to_nl80211_he_gi() in
> the declaration is u32, while the definition spells enum nl80211_he_gi.
> Synchronize them to the latter.
> 
> Cc: Martin Liska <mliska@suse.cz>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

dd1c23226945 wifi: ath11k: synchronize ath11k_mac_he_gi_to_nl80211_he_gi()'s return type

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221031114341.10377-1-jirislaby@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
