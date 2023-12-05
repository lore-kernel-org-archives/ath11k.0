Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A1CC10F04
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 15:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fSE5VIhzeCzBFsihDlHNch9Cj0Fh+f/AyIZZwlemTg=; b=s7GjPdrpToN9SeGU1iwEbbkUw+
	fzgHu9YbgV1N0vx5ChQFm6gmCjErvQrNWfb5hvXbO/IHWFbalPZSvLXtiyG2AhnEXaBcbr0cfjX7E
	IVWXOO2lUoZ0i/IQeqLO282FlY7fGLPAoo22SqBei5CDCqgh+2juPA1Fc4PLxv49Vwr4Fp2Gs1TGX
	w8RbwDeWFGoX5kbqGsb1ueYC5xJvMRqcZUDT7442Cg6/CWDe2QKh0HcKTjLZvn+WrF/JL0BLXgk04
	lz7ZAHgObAtF3wYvprJSqeqOeKBIceYqbE7brUaNnDaY+9h3nYWWdrXsSnV4YRtcyge6Z93EPTMxh
	jQITcYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXMM-007lH9-34;
	Tue, 05 Dec 2023 15:29:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAXMK-007lGL-00;
	Tue, 05 Dec 2023 15:29:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 136F0CE114D;
	Tue,  5 Dec 2023 15:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A90DC433C9;
	Tue,  5 Dec 2023 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701790152;
	bh=MfLafCfcRaDpmdszQrVQWn7XO/mPGu2x0vw5QhEpwMU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=hUkDezEB4Iwi6LnBU9YZQVH/Z3YCUHfzhbNV5af7LhhqlzL0gSQPDaiLyjeP/KkKr
	 529hiF43YIwRbaELj0t2q9r2MbylgnOGoPzn2e+cdTIksEkwHCQ9a4GS1q/gpjRPsM
	 msDyp2mexulTyX3XHpruoKphejmCACcFV2QYVQNvM2TiAAT4P3ek9swSkoGYUoJE9X
	 EUxuE55TQuqxMqcUcmHK7jXBkH9JIJCoqUx8tH0KLyCYRUgrTJP2WyP3qj0WPWrp2I
	 Hy1+kqUUG5WtYuzqJWC7PTdDpFiuJaHQH1MyTPRQWGh8pARz2EkIVoxEEpF1L763he
	 g/qK06yXDCOYg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Kees Cook <keescook@chromium.org>,
  <ath10k@lists.infradead.org>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
	<20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
	<4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
	<c5555ad6-6991-4fca-864f-355d2fae9ae1@quicinc.com>
Date: Tue, 05 Dec 2023 17:29:08 +0200
In-Reply-To: <c5555ad6-6991-4fca-864f-355d2fae9ae1@quicinc.com> (Jeff
	Johnson's message of "Mon, 27 Nov 2023 08:32:51 -0800")
Message-ID: <87edg0pt17.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_072916_234640_E1C5E5FB 
X-CRM114-Status: GOOD (  13.06  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 11/27/2023 8:23 AM, Gustavo A. R. Silva wrote:
>
>> 
>> 
>> On 11/27/23 10:14, Jeff Johnson wrote:
>>> Transform the zero-length array in ath11k_htc_record into a proper
>>> flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
>>> ongoing efforts to globally enable -Warray-bounds.
>>>
>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/htc.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
>>> index 84971cc9251c..e0434b29df70 100644
>>> --- a/drivers/net/wireless/ath/ath11k/htc.h
>>> +++ b/drivers/net/wireless/ath/ath11k/htc.h
>>> @@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
>>>   struct ath11k_htc_record {
>>>   	struct ath11k_htc_record_hdr hdr;
>>>   	union {
>>> -		struct ath11k_htc_credit_report credit_report[0];
>>> +		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
>>>   	};
>> 
>> Why not removing the `union` and just do a direct transformation [0] -> [ ] ?
>
> No reason other than staying consistent with ath10k.
> Will see if Kalle has an opinion on this.

Yeah, I don't see the need for the union and I removed it in the pending
branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a2faeea1fe0635563187e7821a6d0baf7b40f2c6

Does it look ok?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

