Return-Path: <SRS0=PCnT=O4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2EEC433F5
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 14:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3DDC60F58
	for <ath11k@archiver.kernel.org>; Fri,  8 Oct 2021 14:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3DDC60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SMyARN5wOTgDQa5dfkGC98oGP4HZro1arOXXXI4jjY=; b=MMt3D2bGS5Oxdc
	aElOQp3cfYMhQeNnvLRt7p3oT42RupbEmkUS0yx4C4/KfVaCfIVzX5LIhtLvxgDtL3L3Btc9klqxb
	zFya+MwipUKfUs9zVQ04iWTrYjuAFLC5W6iiUKtBoKs0rhWk8JKdzIDSeUr1Rj3QNie2Irt4qR3/c
	tojc5n1Ul4qHKJm6y1K57g1O9hlwbSvqWT5wAV/j6Uk4V1docGp1+L406kvAAfdvbpziNCFIR+tTv
	Hyf8SD51OpnYYD1TG9Z23WNF40h+pxzdrLJwoiWz5kZcwIQ8Sb3FxsmaS5Gd+zMCHyccGIVhw1A0Z
	0I3k56vyaIBAT+DMYNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYr6S-0038KR-M0; Fri, 08 Oct 2021 14:44:04 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYr6N-0038Is-6e
 for ath11k@lists.infradead.org; Fri, 08 Oct 2021 14:44:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633704240; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9zDcaEkAkspustVVY2KAKAYV6I1Sut33Nhr4VG24NAw=;
 b=JZ5eSyKTusKpXAyWAIAWHQAGdMZLmkTTfuz9HRe0ZfpmVkoppqdLJzxjM7vKbY39Fz3e61ib
 Kl48MqSSlXEWhkMqrhvblGNVoAK3/p/No1JQkVRmHoVqcm+X+pMF29Y2DTZiN0wFpAsZBDid
 nTotMQvoJ1xplMpdeCnX7mbYBSY=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61605921a45ca75307d75bad (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:43:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A2ACDC4360D; Fri,  8 Oct 2021 14:43:44 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 51711C4338F;
 Fri,  8 Oct 2021 14:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 51711C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Miller <davem@davemloft.net>,
 Networking <netdev@vger.kernel.org>, Jouni Malinen <jouni@codeaurora.org>,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 ath11k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
References: <20211008162103.1921a7a7@canb.auug.org.au>
 <87tuhs5ah8.fsf@codeaurora.org>
 <CAMuHMdUZa9o15_fGJ7Si_-bOQVcFOxtWgo_MOiKsV0FjoPeX6Q@mail.gmail.com>
Date: Fri, 08 Oct 2021 17:43:39 +0300
In-Reply-To: <CAMuHMdUZa9o15_fGJ7Si_-bOQVcFOxtWgo_MOiKsV0FjoPeX6Q@mail.gmail.com>
 (Geert Uytterhoeven's message of "Fri, 8 Oct 2021 10:14:25 +0200")
Message-ID: <87pmsf60h0.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_074401_071580_1A6ED49A 
X-CRM114-Status: GOOD (  27.95  )
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

Hi Geert,

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> On Fri, Oct 8, 2021 at 7:55 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>> Stephen Rothwell <sfr@canb.auug.org.au> writes:
>>
>> > After merging the net-next tree, today's linux-next build (xtensa,
>> > m68k allmodconfig) failed like this:
>> >
>> > In file included from <command-line>:0:0:
>> > In function 'ath11k_peer_assoc_h_smps',
>> >     inlined from 'ath11k_peer_assoc_prepare' at drivers/net/wireless/ath/ath11k/mac.c:2362:2:
>> > include/linux/compiler_types.h:317:38: error: call to '__compiletime_assert_650' declared with attribute error: FIELD_GET: type of reg too small for mask
>> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>> >                                       ^
>> > include/linux/compiler_types.h:298:4: note: in definition of macro '__compiletime_assert'
>> >     prefix ## suffix();    \
>> >     ^
>> > include/linux/compiler_types.h:317:2: note: in expansion of macro '_compiletime_assert'
>> >   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>> >   ^
>> > include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>> >  #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>> >                                      ^
>> > include/linux/bitfield.h:52:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>> >    BUILD_BUG_ON_MSG((_mask) > (typeof(_reg))~0ull,  \
>> >    ^
>> > include/linux/bitfield.h:108:3: note: in expansion of macro '__BF_FIELD_CHECK'
>> >    __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: "); \
>> >    ^
>> > drivers/net/wireless/ath/ath11k/mac.c:2079:10: note: in expansion of macro 'FIELD_GET'
>> >    smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
>> >           ^
>> >
>> > Caused by commit
>> >
>> >   6f4d70308e5e ("ath11k: support SMPS configuration for 6 GHz")
>>
>> Thanks for the report, weird that I don't see it on x86. I can't look at
>> this in detail now, maybe later today, but I wonder if the diff below
>> fixes the issue?
>
> It seems to be related to passing "le16_to_cpu(sta->he_6ghz_capa.capa)".
> Probably typeof(le16_to_cpu(sta->he_6ghz_capa.capa)) goes berserk.
> le16_to_cpu() is a complex macro on big-endian. I had expected to see
> a similar issue on powerpc, but I don't.
> Using an intermediate "u16 capa = le16_to_cpu(sta->he_6ghz_capa.capa)"
> fixes the problem.
>
>> At least it's cleaner than using FIELD_GET(), actually ath11k should be
>> cleaned up to use xx_get_bits() all over.
>>
>> Kalle
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
>> index d897020dd52d..3e7e569f284b 100644
>> --- a/drivers/net/wireless/ath/ath11k/mac.c
>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
>> @@ -2076,8 +2076,8 @@ static void ath11k_peer_assoc_h_smps(struct ieee80211_sta *sta,
>>                 smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
>>                 smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
>>         } else {
>> -               smps = FIELD_GET(IEEE80211_HE_6GHZ_CAP_SM_PS,
>> -                                le16_to_cpu(sta->he_6ghz_capa.capa));
>> +               smps = le16_get_bits(sta->he_6ghz_capa.capa,
>> +                                    IEEE80211_HE_6GHZ_CAP_SM_PS);
>>         }
>
> Thanks, that works, too, so (compile)
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert, you helped a lot! I now submitted a patch to netdev:

https://patchwork.kernel.org/project/netdevbpf/patch/20211008143932.23884-1-kvalo@codeaurora.org/

Dave & Jakub, if you can please take the patch directly to net-next.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
