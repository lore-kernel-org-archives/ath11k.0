Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 710A4C25B74
	for <ath11k@archiver.kernel.org>; Thu, 16 May 2024 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CdaRdgRhRtmPhB95HwGxkR3KixTgzNdL+5gbgKKmgxM=; b=Gd2sUxpYgRxlUH
	DFHyws2J2MYC+MNJQAGW0zSOmuK9W2ZCC1gFzHz5i5oUml8KtLHHBHb+oPxXTHc1zA+yel0DQOs1I
	70V6ue0NtkcQ56teytBFxXJxiaWav5m4D3CT91upDeheOcXK02TjMYwJlECWib3ReG3v2UM4n75Gq
	ypjNUkdldgg4IlcpXrQNTFdeHfdtk4Loawh+8o+5Ar0txg4ympMLHrn8zgWCcsDfSS4KVc23+7jMM
	5xSJO3tuBM6hmbpRTig6HR6BKzwRVFV/U+AKknn05SqnnkiEj+NZwxqXxfDx06Zm4uPfvD0A3GwcO
	fm+O9QiVvCSj4dYqfFXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZVB-00000004egZ-0hXW;
	Thu, 16 May 2024 11:42:25 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ZV6-00000004ed6-2dLK
	for ath11k@lists.infradead.org;
	Thu, 16 May 2024 11:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=CdaRdgRhRtmPhB95HwGxkR3KixTgzNdL+5gbgKKmgxM=;
	t=1715859740; x=1716291740; b=G6prGEYwqZj5J+O/uF3CZsIu2oGAyfxmAqs3KN2qGb/BuCl
	lxOoZSrlQyrw3VwmgvIYD/3cDG3XM79dZX5ej2TnuZcStHb/twXQTBwXILxoF4/VrnJDQZbfKhGwq
	L9FdbPtqwgVZlNh+sIQFhZ4mRkDyqFFx6avwEKbtjMUfVWIrWcTXmct6BFroOlNyi9WDNGLPpsKgR
	lzZmZkRzVwUerxjg5FmV1O90D9nNpU0MNq01qsfrbLHjKZvR8FhQepcW+C5RXdHiTpLvbBhwRTKuQ
	pxOP7Wd/A/vq4HzOu5cjoyaHcQV6aaUa5qvQP5ruWuF81zlaekQJCRSkNuI91ZVw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s7ZUx-0001I0-JB; Thu, 16 May 2024 13:42:11 +0200
Message-ID: <51aea1fb-ce72-4c94-a3dd-43e84763834b@leemhuis.info>
Date: Thu, 16 May 2024 13:42:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
To: Kalle Valo <kvalo@kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
 <87wmo0k71i.fsf@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <87wmo0k71i.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715859740;72d0db49;
X-HE-SMSGID: 1s7ZUx-0001I0-JB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_044220_879309_99B7E5F0 
X-CRM114-Status: GOOD (  12.09  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11.05.24 11:54, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>> ath11k fails to connect to 6 GHz AP.
>>
>> This is because currently ath11k checks AP's power type in
>> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
>> However with above commit power type is not available until ASSOC stage.
>> As a result power type check fails and therefore connection fails.
>>
>> Fix this by moving power type check to ASSOC stage, also move regulatory
>> rules update there because it depends on power type.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> Oh, this fell through the cracks. Commit bc8a0fac8677 was introduced in
> v6.9-rc1 so I should have sent this to v6.9 but it's too late now. I'll
> need to queue this for v6.10 via wireless tree.

I might have missed something, but from here it looks like that hasn't
happened yet. If I missed something or if you are busy with more
critical stuff, feel free to ignore this mail; if it fell through the
cracks again, consider this a friendly reminder that this is still
waiting for processing.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

