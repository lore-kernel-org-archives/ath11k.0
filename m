Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB73C433EF
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 15:20:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAEFA60F9D
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 15:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAEFA60F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w6ObO5vfRmtsSJtaKg51N2z/KCOkPdrmx34m/EaVdEE=; b=UHyUx1M4jweEkh
	1VKl8X+lTY2oJ1ThD6v8EjC1hi7vDQ1S7qHyVd0f6n2kdi9f9lt15fE4MtMTik/WvQLK2toiNMEFH
	51G0UrgeslswU655AZlfzMgSottZ5wA1wgq/ocwabsFFlFQkA78+yYoiT0Dxp0N5KSXnBSUATici/
	dyzRpxi9F+OY8MztyZWzGq1f2nCnm0EXdxmC5BdKjpIBQpRhKfUdRNVcYNtHHtBApuqUTkR4pFDSS
	iWXIKpD3rH/pAzHSDh8SVNnxUBjxag4Jb+BcuRuVUTjX8yHQplyP1tLr296x9FBS2evvrD6v/kYia
	VISLYU/sOk1RTIaJMd/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYrfN-003DTJ-Pf; Fri, 08 Oct 2021 15:20:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYrfL-003DSw-HD
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 15:20:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C9A460FD8;
 Fri,  8 Oct 2021 15:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633706407;
 bh=XaoepD9pnpqvmvlNYkOauTaOInKIGi3EeI10E4+GpuA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=LYVqtEzlITS9He8HreSE7lMmRr3pSD86Inmf9xioAt6/nrWgURw5UrLBxyH1cMqeD
 Eklo73u6xQSSw1HlCYYOl5Piyfwa4K+/AZx+CYnw8KmxYVK6Y+7mV4mPvQ3gqi2OpE
 oQZl7vfX1vOmLDM60W+ePxJmdurLPsVVWWQd67cpW3v9ueNgQp8XeeO0Q+neJhlfhr
 Sva7GoHxZQ0sVraprAdNPd7X77UesX+c4pEFpB2ZowHi+2mEF+nbhmLGwirj4rag/e
 lYHBeSKakEm+jtO/MrChPh9KseJz/J1C2aIL8NSvQFQXebUPVsOGoF2Xr1195cEVhl
 3ZTvuzp/C5hhQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] ath11k: fix m68k and xtensa build failure in
 ath11k_peer_assoc_h_smps()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163370640705.31693.17970287687909944942.git-patchwork-notify@kernel.org>
Date: Fri, 08 Oct 2021 15:20:07 +0000
References: <20211008143932.23884-1-kvalo@codeaurora.org>
In-Reply-To: <20211008143932.23884-1-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, sfr@canb.auug.org.au, geert@linux-m68k.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_082007_634152_BED16903 
X-CRM114-Status: UNSURE (   8.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri,  8 Oct 2021 17:39:32 +0300 you wrote:
> Stephen reported that ath11k was failing to build on m68k and xtensa:
> 
> In file included from <command-line>:0:0:
> In function 'ath11k_peer_assoc_h_smps',
>     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2362:2:
> include/linux/compiler_types.h:317:38: error: call to '__compiletime_assert_650' declared with attribute error: FIELD_GET: type of reg too small for mask
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>                                       ^
> include/linux/compiler_types.h:298:4: note: in definition of macro '__compiletime_assert'
>     prefix ## suffix();    \
>     ^
> include/linux/compiler_types.h:317:2: note: in expansion of macro '_compiletime_assert'
>   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>   ^
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                      ^
> include/linux/bitfield.h:52:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>    BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,  \
>    ^
> include/linux/bitfield.h:108:3: note: in expansion of macro '__BF_FIELD_CHECK'
>    __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
>    ^
> drivers/net/wireless/ath/ath11k/mac.c:2079:10: note: in expansion of macro 'FIELD_GET'
>    smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
> 
> [...]

Here is the summary with links:
  - [net-next] ath11k: fix m68k and xtensa build failure in ath11k_peer_assoc_h_smps()
    https://git.kernel.org/netdev/net-next/c/16bdce2ada5a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
