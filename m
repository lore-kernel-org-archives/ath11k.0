Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81B1C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 14:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5yr4VCIYl0nDvdHiFzp94+Nx33Pi32zfVrZ3rMXz/0=; b=mE0l7tjujEoLLa
	FxOAqbCTPP67WT0AvQ6o2bX86r0sFKwRMjPVy5kD+fq7nNsOLFCdX4TJSmgIBTRCdtp0BNcJimT3A
	BT64TAb8GkD3Fhavb7uBejmvnjJ++iYt4zhKIItuL9JJGz1HXbEf4DTGKhHWgBZoO8hEiBo3joKft
	7wZ7iMUKcxOYnkqkQMwwyw9Y6+L19cTPeJFjc+HSMuWgVd3My5jlCxW/3pA9/Y5EgxnwrMyE9VsDI
	dioYLOR059iPzaSkvbvcUy0adddhpvPhraKuirmP+mWsL/V1Ee0sYYlSQ41oYKbod42sbHVA5uN/9
	wzzTFCIpPeFtuaZFy6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7I6q-00GZ5B-M1; Tue, 11 Jan 2022 14:26:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7I6n-00GZ4R-Ab
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 14:26:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D576161685;
 Tue, 11 Jan 2022 14:26:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09B2C36AE3;
 Tue, 11 Jan 2022 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911204;
 bh=YGvpnQ/J66bACt6CW2YyeL65jkt7QTaOAw9TCVUj6pk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=a9Oevss0CXsyzEdmzW6nQNsjDT3LZ20OSZL3FM1TZMMaUMvKowIL1o+c3xoO55Aes
 96dyVJDgRAwSne2u6zRIvpAaSWhgDtLA7ZZ7hjx+3TuCOHO/p+tTWjdow3vzbKX5XK
 N63gfuQ5Pi58QseJzBw9r2w0tQK/HYM/YfWhpQ8ATThzDFP0lnn7H2rF5ZzCrBg6Zl
 I6paR2RrDdALniEvaImjPvXB1JDlpnYnewOaMgTSjKPhOGufuauzxNAtFe6hsI1cgb
 6RvbDpIwkWq2bKvrLhi22aIp7PtDUqlj9zhdU6FFx2/RJJ/ETQNKfzDMjcJbKcE4ew
 qFkHUzPw+wRnA==
From: Kalle Valo <kvalo@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kbuild@lists.01.org, Wen Gong <quic_wgong@quicinc.com>, lkp@intel.com,
 kbuild-all@lists.01.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [kvalo-ath:pending 52/56]
 drivers/net/wireless/ath/ath11k/wmi.c:5651
 ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol 'len'.
References: <202112110427.o6xDAKfE-lkp@intel.com> <87czkyv1i9.fsf@kernel.org>
 <20220111135805.GL1978@kadam>
Date: Tue, 11 Jan 2022 16:26:38 +0200
In-Reply-To: <20220111135805.GL1978@kadam> (Dan Carpenter's message of "Tue,
 11 Jan 2022 16:58:05 +0300")
Message-ID: <874k6auz4x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_062645_463787_1C410075 
X-CRM114-Status: GOOD (  17.92  )
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

Dan Carpenter <dan.carpenter@oracle.com> writes:

> On Tue, Jan 11, 2022 at 03:35:26PM +0200, Kalle Valo wrote:
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5629 static int
>> > ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5630 struct wmi_tlv_fw_stats_parse
>> > *parse,
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5631 const void *ptr)
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5632  {
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5633 struct ath11k_fw_stats *stats
>> > = parse->stats;
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5634 const struct wmi_stats_event
>> > *ev = parse->ev;
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5635  	int i;
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5636  	const void *data = ptr;
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5637  	u32 len;
>                                                         ^^^^^^^^
> "len" is a local variable, not a parameter.

Ah, I only looked at the current ath-next branch.

>> > bc5c448b70ff14 Wen Gong   2021-12-08  5638  
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5639  	if (!ev) {
>> > bc5c448b70ff14 Wen Gong 2021-12-08 5640 ath11k_warn(ab, "failed to
>> > fetch update stats ev");
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5641  		return -EPROTO;
>> > bc5c448b70ff14 Wen Gong   2021-12-08  5642  	}
>> > d5c65159f28953 Kalle Valo 2019-11-23  5643  
>> > d5c65159f28953 Kalle Valo 2019-11-23  5644  	stats->stats_id = 0;
>> > d5c65159f28953 Kalle Valo 2019-11-23  5645  
>> > d5c65159f28953 Kalle Valo 2019-11-23 5646 for (i = 0; i <
>> > ev->num_pdev_stats; i++) {
>> > d5c65159f28953 Kalle Valo 2019-11-23 5647 const struct wmi_pdev_stats
>> > *src;
>> > d5c65159f28953 Kalle Valo 2019-11-23 5648 struct ath11k_fw_stats_pdev
>> > *dst;
>> > d5c65159f28953 Kalle Valo 2019-11-23  5649  
>> > d5c65159f28953 Kalle Valo 2019-11-23  5650  		src = data;
>> > bc5c448b70ff14 Wen Gong 2021-12-08 @5651 if (len < sizeof(*src))
>> >
>> > "len" is never initialized.
>> 
>> I only quickly looked at this, but AFAICS ath11k_wmi_tlv_iter() provides
>> len to ath11k_wmi_tlv_fw_stats_parse() which again provides len to
>> ath11k_wmi_tlv_fw_stats_data_parse(). I'm not seeing how this is
>> uninitalised, did I miss something?
>
> I think the bug was fixed and the tree was rebased?

Most likely there were some changes, but I can't remember anymore. Too
many patches :)

> I only look at the email and hit forward and the code in the email was
> clearly buggy but tree looks okay now as you say.

Good, thanks for checking.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
