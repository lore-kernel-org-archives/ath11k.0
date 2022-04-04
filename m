Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B73DC433EF
	for <ath11k@archiver.kernel.org>; Mon,  4 Apr 2022 16:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4kzjTdfUAnjIm28RXYmsjBTfs7DtSprMj8HxixZ2S0=; b=GBmWiF0K8/PKIP
	TdsFgrw4GA0SApa3FI86HbBFSPv5//YQGJTFuY6oxZYjgkc8aPoeAF8oDm4F9Nyt+ApwF8xfUSm5b
	M8LEHyjDovOwNm+EnxBLR5OKENhtXYE5kRNWPbJrbqPdhZ8BqXGbWZN1+LPwg7UU8oGa2zxFbTY3O
	KVmWq3phNrAhrwHHH+D3rc1MfGa5BDJYnM6D6zje7WYlL++Hupzh07omHxUGp/LhIlQF/0hNkI5x4
	TRi93+/DarnKZ/eF/Ho4U7PPNYSZzCZ3pkOPQvtru61v49DOkZbn3F8lq+mTmsOOXzTeQyql4/wJ2
	xCwEtCk4jYSLrjWYjJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbPvL-00FroE-HP; Mon, 04 Apr 2022 16:51:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbPvJ-00Frno-2J
 for ath11k@lists.infradead.org; Mon, 04 Apr 2022 16:51:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8484560C91;
 Mon,  4 Apr 2022 16:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF3AC340EE;
 Mon,  4 Apr 2022 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649091083;
 bh=0bh6tgeWrV6jjXz4an0tH+2Fm7IC79r94QHSjTTYizg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=SzHqFfKCWYDzEtYwvxuBw1O026/x4UNrHPbqWBBvEqsH3XKPeaigYqDfzDfeR6y1f
 /KYDcs8Jnyu/qmti7lJGLW3C0eONEUZ1cp10t+8pzJQ9qW4bfHF8QAyEDQ0fUCp+Zq
 B7Sucg4RitfcjnrTsF0JrY1W1SJ1F2WdHFhHVBxNZJ10EX7YIGcRRfYsxZGUMG+xhO
 kxRG6LgacZEjeNY97G0Vcglq+E3XoA0SU54X6izDtzeA26Cdf9btWB8RbHod1uhdKT
 98svNsanspmPNPf3m6w2CxrEc02b2htKumn7+vzILhZkqDlB9xvyUMilKsOGVl9Mok
 ZIpI9SQsylqSA==
From: Kalle Valo <kvalo@kernel.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Robert Marko <robert.marko@sartura.hr>, David Miller <davem@davemloft.net>,
 kuba@kernel.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ath11k: do not return random value
References: <20220404105324.13810-1-straube.linux@gmail.com>
 <CA+HBbNHEK=CbyeeyPG=s=D2xofdSbk8Lxx5R9nij_cp6t7ybDA@mail.gmail.com>
 <1bd30dce-4046-721b-2207-32ace83af441@gmail.com>
Date: Mon, 04 Apr 2022 19:51:16 +0300
In-Reply-To: <1bd30dce-4046-721b-2207-32ace83af441@gmail.com> (Michael
 Straube's message of "Mon, 4 Apr 2022 18:45:11 +0200")
Message-ID: <87ilrossfv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_095125_221591_E195F081 
X-CRM114-Status: GOOD (  18.44  )
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

Michael Straube <straube.linux@gmail.com> writes:

> On 4/4/22 18:35, Robert Marko wrote:
>> On Mon, Apr 4, 2022 at 12:54 PM Michael Straube <straube.linux@gmail.com> wrote:
>>>
>>> Function ath11k_qmi_assign_target_mem_chunk() returns a random value
>>> if of_parse_phandle() fails because the return variable ret is not
>>> initialized before calling of_parse_phandle(). Return -EINVAL to avoid
>>> possibly returning 0, which would be wrong here.
>>>
>>> Issue found by smatch.
>>>
>>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/qmi.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
>>> index 65d3c6ba35ae..81b2304b1fde 100644
>>> --- a/drivers/net/wireless/ath/ath11k/qmi.c
>>> +++ b/drivers/net/wireless/ath/ath11k/qmi.c
>>> @@ -1932,7 +1932,7 @@ static int ath11k_qmi_assign_target_mem_chunk(struct ath11k_base *ab)
>>>                          if (!hremote_node) {
>>>                                  ath11k_dbg(ab, ATH11K_DBG_QMI,
>>>                                             "qmi fail to get hremote_node\n");
>>> -                               return ret;
>>> +                               return -EINVAL;
>>>                          }
>>>
>>>                          ret = of_address_to_resource(hremote_node, 0, &res);
>>> --
>>> 2.35.1
>>
>> Hi Michael,
>> This is already solved in ath-next and 5.18-rc1:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/wireless/ath/ath11k/qmi.c?h=v5.18-rc1&id=c9b41832dc080fa59bad597de94865b3ea2d5bab
>>
>
> Hi Robert,
>
> Ah ok, then I worked with the wrong tree (wireless-drivers-next).
> Sorry for the noise.

wireless-drivers[-next] and mac80211[-next] trees are not in use
anymore, we switched to using a common wireless and wireless-next trees:

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/

https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
