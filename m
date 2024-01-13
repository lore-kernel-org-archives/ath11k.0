Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A517C4706C
	for <ath11k@archiver.kernel.org>; Sat, 13 Jan 2024 10:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrlH0dI/rLGPYpeW0qH4BHPJwFKQcBa4W+d2qHa/7vc=; b=vZJ8COZotp0dKBTaWFIF6plwzi
	eXxr3Y9vsZY2/V+5uD9eVma86xQ3JrREBRF1CuzeLboGQnYiSfT0EM7/cOUYtJrHGVOOshbGXWyqW
	lNAd5jgVESzXfoC/wc92dwjSpUTosdeK8lQdhG7LvVYUvcvhtt1WFDeabsk3TrrnKBC/sruvQn85m
	kivlxj+znQV7MGXBxGMu5iMNgcP1knUEqhStkv3lL2h8Dw6gPq/YJyoe/dt6X06PMprXZFM9yC2Vs
	R2Ow9LXNMjWcI3OjsQkjHe7Aex9/0m6WYJ3JhHNoVucOVtgF8MTUTWnMlrjHUNX+CARAmBvPrJqaW
	qCGDwJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rObEk-004tqq-0V;
	Sat, 13 Jan 2024 10:27:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rObEh-004tov-0V
	for ath11k@lists.infradead.org;
	Sat, 13 Jan 2024 10:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 384D8B82431;
	Sat, 13 Jan 2024 10:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371DDC433F1;
	Sat, 13 Jan 2024 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705141616;
	bh=JFI/sg9PG8bnP6shSEl0PaqRN8tCMbNQeFxvpUYK4tU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=j3PCvLUmYJFRYZIniSh4Vb51WLTdh9rzhALwc4E+Xmuzk37yJU3u3xFKcKB5inpTl
	 dQ6lcf8I0iSHk5+9ZHifVBhNp1/jGC2L6pzO9hzdFFteQi00Muw2CnaMG+MaNyOkOS
	 RJpuoKU45iQfqdWJ0jblk+EZQUNyGdR7+JYZhusJDCaZC4uLYbDHHjpDeYUceCS38+
	 NWCfN/85UD0KJ2O5DC05YEYdzliR6OpnFRPkeMGIsBfhE51pHv+jX2Bs/22UXjvSeM
	 ivZVD93M3fZbOkayTKoh/o88yKvrKWBlspoIjBwNavs9+Vom9kKWAA1RY/LOCPuMNa
	 +O1uruxECWEaw==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: ath11k: checking RCU usage
References: <20231019153115.26401-1-johan+linaro@kernel.org>
	<87o7goxget.fsf@kernel.org> <ZTfgJCBxsNv3bVjv@hovoldconsulting.com>
Date: Sat, 13 Jan 2024 12:26:53 +0200
In-Reply-To: <ZTfgJCBxsNv3bVjv@hovoldconsulting.com> (Johan Hovold's message
	of "Tue, 24 Oct 2023 17:17:56 +0200")
Message-ID: <87zfx98r6a.fsf_-_@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_022731_346449_B3601612 
X-CRM114-Status: GOOD (  14.87  )
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

(old discussion, changing title)

Johan Hovold <johan@kernel.org> writes:

> On Tue, Oct 24, 2023 at 05:07:38PM +0300, Kalle Valo wrote:
>
>> Johan Hovold <johan+linaro@kernel.org> writes:
>> 
>> > RCU lockdep reported suspicious RCU usage when accessing the temperature
>> > sensor. Inspection revealed that the DFS radar event code was also
>> > missing the required RCU read-side critical section marking.
>> >
>> > Johan
>> >
>> >
>> > Changes in v2
>> >  - add the missing rcu_read_unlock() to an
>> >    ath11k_wmi_pdev_temperature_event() error path as noticed by Jeff
>> >
>> >
>> > Johan Hovold (2):
>> >   wifi: ath11k: fix temperature event locking
>> >   wifi: ath11k: fix dfs radar event locking
>> 
>> Thanks for the fixes. I really like using lockdep_assert_held() to
>> document if a function requires some lock held, is there anything
>> similar for RCU?
>
> Not really, but the checking is instead built into the primitives like
> rcu_dereference() and enabled whenever CONFIG_PROVE_RCU is set.
>
> For some special cases, we have open-coded checks like:
>
> 	RCU_LOCKDEP_WARN(!rcu_read_lock_held());
>
> which similarly depend on CONFIG_PROVE_RCU or simply
>
> 	WARN_ON_ONCE(!rcu_read_lock_held());

I just found out that sparse has __must_hold():

https://lore.kernel.org/linux-wireless/87sf31hhfp.fsf@kernel.org/

That looks promising, should we start using that in ath11k and ath12k to
check our RCU usage?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

