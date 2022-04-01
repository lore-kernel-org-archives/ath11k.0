Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6130AC433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvbwAFue4q+Z4+NlHsaY9k89c6WTl6fq+AJJqyEeSkM=; b=qyvsFXbFESoqZ3
	fXJMzPzO96V9K3KLVnDBKDkx3X3/MduvQtrbh3mCjEFTDLz+036jWfis9dI7fYDtEhDj/lDLmu6SY
	fhl1A4XVZ29/ZO0jupYyAnyO7prz3dpeH8WV0fWVsJKAzP1Hg8eN3mSVYYt2A76Vu4qmJ2uEdGF0X
	T7bWSjIY3SZ3F2ZbkL0aaLfUHRkZS5ZQgo98Hf5MANb0XkuY5RcERH/ERty2OxcZU6MT+q/NlVU5G
	RJiC0hgT6DxjDmlpPZmO/RIx0erDLsTjozH7vhmPnIGXpVM+67B6o9pmx8d/Xx7Lf42GWm4wvWZ+X
	Et5a2kUdmj1w2uCwv1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naFSB-005N93-Gm; Fri, 01 Apr 2022 11:28:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naFS8-005N8b-J8
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 11:28:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 49501B82371;
 Fri,  1 Apr 2022 11:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A345C2BBE4;
 Fri,  1 Apr 2022 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648812505;
 bh=OGPs7QPfIe4uK6qCD5NhS8JC+pB6ZWfO4gHmnuvtubI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=DrkzPJtawXy3ZOUJIaVZnBj9qE1Ct7rfFBtRFR9hy5705d46Lm5KZ2wZ8X0HOFFHb
 xQaKyOOKHRZlDFlCcuPRybWNLD6uL/kEL0MJEc7z9aOF3dc2LCA1YwTpdvBRiM8BK8
 HmwpwR7IX7KWbdsuVNi5w+kbRwTgNL2vU5tARgpkhhlyg9zO980rTakw547pOSLxfs
 YH0NDkfCew1ihSrZBXMi5ipYWCCl0VM9246Abgw53kjH8gqS/0VRZZXoQG0T9EQJ/I
 lch6iX682ViLO2Wc9Q6ovDwLqNpMBFAwOlF/hUssF+yYj5oQUsZ3UdjQOC5yXFMbDa
 eGf0GaCC+awIQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Nagarajan Maran <quic_nmaran@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5.18] ath11k: fix driver initialization failure with WoW
 unsupported hw
References: <20220331073110.3846-1-quic_nmaran@quicinc.com>
 <87sfqyv1td.fsf@kernel.org>
 <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
Date: Fri, 01 Apr 2022 14:28:18 +0300
In-Reply-To: <2f25bb87e665488b30f6fdaa5877ad8b5b19da0a.camel@sipsolutions.net>
 (Johannes Berg's message of "Thu, 31 Mar 2022 13:59:04 +0200")
Message-ID: <87ee2hujot.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_042828_817032_154092C6 
X-CRM114-Status: UNSURE (   9.81  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2022-03-31 at 13:44 +0300, Kalle Valo wrote:
>> > 
>> > Fixes: ba9177fcef21 ("Add basic WoW functionalities")
>> 
>> Fixes tag is wrong, it should be:
>> 
>> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>> 
>
> $ git config --global --add alias.fixes 'show -q --format=fixes'
> $ git config --global --add pretty.fixes 'Fixes: %h ("%s")'
> $ git config --global --add core.abbrev 12
> $ git fixes ba9177fcef21
> Fixes: ba9177fcef21 ("ath11k: Add basic WoW functionalities")
>
> :)

Hehe, really nice! I added this to the wiki:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#fixes_line_is_incorrect

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
