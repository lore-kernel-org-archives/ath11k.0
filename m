Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74929C47DAF
	for <ath11k@archiver.kernel.org>; Mon, 22 Jan 2024 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGmuBj0ohF8FzDFwyMT+qYevSXqdNCTr1Rc2OqsYyGc=; b=TkoLvTyZYPRGs0g2VjhkZ3eOoN
	Fdv+fd744bxkz63v3t09O08AywQ5lmQntVYrrJpLznUbHRKImVRqT8MS9PubfK7GSxNF3vyOp/iKf
	7SIezy2/ZqQBAthKUfLf6KpzFngs1j/UDKogZyAkS0O47l0VU6/6Zm562ScbaZInymXe2CzfzRNoQ
	wmdze3cIL27JJXIyBeHjTQA/0Av/YiazZk+0KMSbbJasU7EWH4NcfsEG0Zw3qK4qjMe71sA1Cwa+C
	vzSoF6WgWm/N8EHFBCDuB9h6vzOvNC6WZ9ZQljvjH+WdbYcrGvheK2+8zdCAnElUFZG9ipeYILWIO
	/0cRoMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvS8-00CR2J-2j;
	Mon, 22 Jan 2024 14:39:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvS5-00CR1e-34
	for ath11k@lists.infradead.org;
	Mon, 22 Jan 2024 14:39:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7F611B80E45;
	Mon, 22 Jan 2024 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7403FC43394;
	Mon, 22 Jan 2024 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705934343;
	bh=YSUNPwoWfGMmfWKPSAXl0wleuODMangCwpYPqnFnaIs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=muiakLok3r2D9h9GKyLHPrNJKoRdokMJIFJxNmqszHWRjHTp7xC5ca0Cu0xSNhuYi
	 kBP/mTReYLgN0y8xPQ7tJCOfCALHuGk077uXwQeHXPB9GaZY8kAyapfllCukxEqhZu
	 WnT4uQLE9k3fOs8wR069QbH4uqTmHxhYaSusahVkKtfg1lboxIfroMbHkyRRvSY/Nh
	 bTXeFxFLU5BUa5V9nnZU8/jZGp3i+W/gNJfEZyvA99AV+fipj3PBXWa5lTfSPCRcap
	 7cpVDi5l1XvTtwKgTnmgWyqwaWsEJK9zmGNlWEbwOvTF5qq69wW0mhjAmbU9qu4XYD
	 c+KM8nOAmbHlA==
From: Kalle Valo <kvalo@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: ath11k: checking RCU usage
References: <20231019153115.26401-1-johan+linaro@kernel.org>
	<87o7goxget.fsf@kernel.org> <ZTfgJCBxsNv3bVjv@hovoldconsulting.com>
	<87zfx98r6a.fsf_-_@kernel.org> <Za5pOIkQ0SN2XzHr@hovoldconsulting.com>
	<Za5124pntbOOtURc@hovoldconsulting.com>
Date: Mon, 22 Jan 2024 16:39:00 +0200
In-Reply-To: <Za5124pntbOOtURc@hovoldconsulting.com> (Johan Hovold's message
	of "Mon, 22 Jan 2024 15:04:11 +0100")
Message-ID: <87bk9d301n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_063906_120719_62016106 
X-CRM114-Status: GOOD (  12.33  )
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

Johan Hovold <johan@kernel.org> writes:

> On Mon, Jan 22, 2024 at 02:10:17PM +0100, Johan Hovold wrote:
>> On Sat, Jan 13, 2024 at 12:26:53PM +0200, Kalle Valo wrote:
>
>> > I just found out that sparse has __must_hold():
>> > 
>> > https://lore.kernel.org/linux-wireless/87sf31hhfp.fsf@kernel.org/
>> > 
>> > That looks promising, should we start using that in ath11k and ath12k to
>> > check our RCU usage?
>> 
>> I see that Johannes already commented on this in the thread above.
>> 
>> I'm pretty sure smatch can't be used for this.
>
> I meant "sparse"...

Yeah, that was a disappointment. I should have tested it first :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

