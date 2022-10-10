Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B486C433F5
	for <ath11k@archiver.kernel.org>; Mon, 10 Oct 2022 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNYpknNIxe6ajYi40Jc7Ym6sEO5bUIN4cVCym+N7Xa0=; b=24/IijtliojkV3
	KgZpc+Sd9aQMjciyO0hRwh7+aRKySp91nxkZKW7j+8Tym3sfxmci08iXDNanObDyl5bzKXDE7RWm8
	aP+07qx2n/GQ8J40nFUUfPNKgl1qn0kS1VvQ8D7k5h2+ELBWshBGe8qUfdknajb4vRRfJsw5BsCRL
	sF6ixOWF9SCsgNINfBbC4oph5m8a/TFOCKTv61l+iAFik1MKhQkLWd912GIKFt6irFe1bdIO9zM6f
	veqfjLwhryF8kTggldf9mdj13QAx0a0f3Z7Kti4EZaiy465HN8ZVnSuGHq4Fz1bLsMXoEkPF75Q/s
	K7Z+M9aQx1lJUqIhEyNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohw37-001a5Y-NB; Mon, 10 Oct 2022 16:54:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohw34-001a4E-RT
	for ath11k@lists.infradead.org; Mon, 10 Oct 2022 16:54:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 81956B80E7B;
	Mon, 10 Oct 2022 16:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A1FEC433D6;
	Mon, 10 Oct 2022 16:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665420875;
	bh=qPWTNZGEFYJEvDdkwFCY39pduTasoX2MPE4faZjFyb4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=t5l+1qwolo90SbopV9MI+P+M+f7fq6BmW4pX1FJAWtWDWbvPCt430v6pyP3RHQ/Wt
	 WXhBOzZPLGHezZoSxWW4wCcuOMQBy/ShYXEQgQTtDl623KuQO+vtAURfkwzqUtpiK9
	 bJ6f/pKi8qgT3k4u5nfQHdOy6I3521qnJ7S1owY3e3ahcYzRVCEtlpfAN/sAN3Gr4B
	 RK07rqwIMD3qkovObsKN2CVTLqEsNB1seI3uCb5Vx0EyRHmFYOhb9YU01UTSyHS8uL
	 c6yWO8xfCroHNMUKiyn8aM5LpNkk/T4m1iJnGISl1nzNP1cfBm+adbZgIieTkgtDiu
	 mQBMoOT4prXLQ==
From: Kalle Valo <kvalo@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Netdev <netdev@vger.kernel.org>,  open list <linux-kernel@vger.kernel.org>,  linux-wireless@vger.kernel.org,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath11k@lists.infradead.org,  regressions@lists.linux.dev,  lkft-triage@lists.linaro.org
Subject: Re: drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning: 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size 0
References: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
Date: Mon, 10 Oct 2022 19:54:29 +0300
In-Reply-To: <CA+G9fYsZ_qypa=jHY_dJ=tqX4515+qrV9n2SWXVDHve826nF7Q@mail.gmail.com>
	(Naresh Kamboju's message of "Wed, 21 Sep 2022 16:05:39 +0530")
Message-ID: <87ilkrpqka.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_095439_237079_EDB2FED3 
X-CRM114-Status: GOOD (  12.92  )
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

+ arnd

Naresh Kamboju <naresh.kamboju@linaro.org> writes:

> Following build warnings noticed while building arm64 on Linux next-20220921
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2238 |                         v = ath11k_peer_assoc_h_he_limit(v,
> he_mcs_mask);
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2238:29: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2264 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2264:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In function 'ath11k_peer_assoc_h_he',
>     inlined from 'ath11k_peer_assoc_prepare' at
> drivers/net/wireless/ath/ath11k/mac.c:2662:2:
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: warning:
> 'ath11k_peer_assoc_h_he_limit' reading 16 bytes from a region of size
> 0 [-Wstringop-overread]
>  2251 |                 v = ath11k_peer_assoc_h_he_limit(v, he_mcs_mask);
>       |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_peer_assoc_prepare':
> drivers/net/wireless/ath/ath11k/mac.c:2251:21: note: referencing
> argument 2 of type 'const u16 *' {aka 'const short unsigned int *'}
> drivers/net/wireless/ath/ath11k/mac.c:2019:12: note: in a call to
> function 'ath11k_peer_assoc_h_he_limit'
>  2019 | static u16 ath11k_peer_assoc_h_he_limit(u16 tx_mcs_set,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Build log: https://builds.tuxbuild.com/2F4W7nZHNx3T88RB0gaCZ9hBX6c/

Thanks, I was able to reproduce it now and submitted a patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20221010160638.20152-1-kvalo@kernel.org/

But it's strange that nobody else (myself included) didn't see this
earlier. Nor later for that matter, this is the only report I got about
this. Arnd, any ideas what could cause this only to happen on GCC 11?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
