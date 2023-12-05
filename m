Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E998C4167B
	for <ath11k@archiver.kernel.org>; Tue,  5 Dec 2023 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4AFaKFRCFW/SpnUpyw+Kv12PSuzG2nCLZmWZMXxM2M=; b=P1eVh7+XwNYWOVVkQW9Q1Cpk5V
	BGsSgTpAgMCj//E6cH83nQmDUmG6qtfk6+kAnbrIxNmmXUzpxzGVwwrXaHTSIKgWENDKeNPrD70Ow
	U9g8nqWOndQ3reSiajlqDAleQizlgYmleyhVQJx+ZnKctlaOVLHfVS/8zLYW/6W5YGU/e0tc1+u5G
	Kfi8yqWTTiVlILIEqXLws0R6jDM/iH81VgSIbHWbwZyB/PEN+i3yV/r+hq8FrNaoKSRqSQUtTAIGr
	fd3gWOLRcXdf2gY7EmOQCahwR8gTXaKGDOg7lc/VluogxJ4mXyOMrUoEpXqo96zJSh/mxfFNdEQ14
	XPFK4ZVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAbag-008KDg-3C;
	Tue, 05 Dec 2023 20:00:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAbad-008KBv-1E;
	Tue, 05 Dec 2023 20:00:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ABA59612DB;
	Tue,  5 Dec 2023 20:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D6FC433C7;
	Tue,  5 Dec 2023 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701806418;
	bh=RBZVphrxSnYDxF8yl0ilHhdMH6viddnORNq4gQqJ+FE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=XUHYATuQ/GyNS+eZhUMbDiK7+hG9idnMSxzD4uDk+N0wysPaKZguSD3hxd3LdWcyY
	 8BGn28THz+MZ85eeWikC1v1iUru28mUFQezzjs1YeYCNNEuNJN5qjBXQA8gSu+5b2h
	 T3zyBP9qC67eCgjpVaeRu1aAJgs3tqW4idua8mS58CpyIv5ClAvLgFWRXXuTr+LGEO
	 DAIJJMM0LyvLC87c9hDHMu8IDfnuyMgmpXzGrvxPRREjZFQNWCulayqLtPg9KIqNYh
	 X9Ii7VPijVx5+8btcMKc6vUApMk5MWU5l3GgR76xBHJPs36JnreWHhKWNO/+mhgYCN
	 Yf/JCBDHFQBsw==
From: Kalle Valo <kvalo@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Kees Cook <keescook@chromium.org>,
  ath10k@lists.infradead.org,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
	<20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
	<4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
	<c5555ad6-6991-4fca-864f-355d2fae9ae1@quicinc.com>
	<87edg0pt17.fsf@kernel.org>
	<30ea9d68-e49e-4727-88aa-547b1b0feebf@embeddedor.com>
Date: Tue, 05 Dec 2023 22:00:14 +0200
In-Reply-To: <30ea9d68-e49e-4727-88aa-547b1b0feebf@embeddedor.com> (Gustavo A.
	R. Silva's message of "Tue, 5 Dec 2023 09:45:57 -0600")
Message-ID: <875y1cpghd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_120019_521730_A614D334 
X-CRM114-Status: GOOD (  16.05  )
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

"Gustavo A. R. Silva" <gustavo@embeddedor.com> writes:

> On 12/5/23 09:29, Kalle Valo wrote:
>> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> 
>>> On 11/27/2023 8:23 AM, Gustavo A. R. Silva wrote:
>>>
>>>>
>>>>
>>>> On 11/27/23 10:14, Jeff Johnson wrote:
>>>>> Transform the zero-length array in ath11k_htc_record into a proper
>>>>> flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
>>>>> ongoing efforts to globally enable -Warray-bounds.
>>>>>
>>>>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>>>> ---
>>>>>    drivers/net/wireless/ath/ath11k/htc.h | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
>>>>> index 84971cc9251c..e0434b29df70 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/htc.h
>>>>> +++ b/drivers/net/wireless/ath/ath11k/htc.h
>>>>> @@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
>>>>>    struct ath11k_htc_record {
>>>>>    	struct ath11k_htc_record_hdr hdr;
>>>>>    	union {
>>>>> -		struct ath11k_htc_credit_report credit_report[0];
>>>>> +		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
>>>>>    	};
>>>>
>>>> Why not removing the `union` and just do a direct transformation [0] -> [ ] ?
>>>
>>> No reason other than staying consistent with ath10k.
>>> Will see if Kalle has an opinion on this.
>> Yeah, I don't see the need for the union and I removed it in the
>> pending
>> branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=a2faeea1fe0635563187e7821a6d0baf7b40f2c6
>> Does it look ok?
>> 
>
> Nope.
>
> A direct transformation is just fine:
>
> -	union {
> -		struct ath11k_htc_credit_report credit_report[0];
> -	};
> +	struct ath11k_htc_credit_report credit_report[];
>
> There is no need for DFA in this situation.

Sorry, I read your comments too hastily. Jeff, as I'm offline tomorrow
would you mind submitting v2?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

