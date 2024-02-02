Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C808EC47DB3
	for <ath11k@archiver.kernel.org>; Fri,  2 Feb 2024 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gjWVM+18KwS/clwLGGAoSP00rlPMa+3NqRSuk3UQ4o=; b=QK/t5FRhJgSTe+UoIBBUCV4dvd
	hYoO+fTnraQOoX58EKXARLV9NBkY84E2le4s9dOwrudrG8pPY2445Ci/ecNsuADRwcAhECYJwX1eC
	1Bz1IdSPh9Otd3rM6blvxsBaIkw1SJiIcGI/e+mZdirX3w+nNz2RHLybdmthGLQNe2rrjiR//99Mf
	74XdMIYmJwLZQnWsBKzY1I3xt8Nh07L8I6ofU2r7f5x7iVO3VIHjnAiTi6eeK2a98FSaTvFvJnwuo
	ALjiFSb8DMiZ/BxEWdgXFAT12SYQQlU0E3frRvf8X+jHwRSi5VO790q1eEQIhke/aQ2kgs7QcKHxv
	WsEPXr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrol-0000000BJQC-0pKC;
	Fri, 02 Feb 2024 11:34:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVrog-0000000BJNp-3MNC
	for ath11k@lists.infradead.org;
	Fri, 02 Feb 2024 11:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1ECCECE1F21;
	Fri,  2 Feb 2024 11:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A26CC433C7;
	Fri,  2 Feb 2024 11:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706873680;
	bh=Z36sUISol3n1H+J78EhfUyh0WQQhwLEyy3cNNNXjhiQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=kNXEhKz9vpzYEYHotUm9jbF5xmG9z6zj5c6clJDRXC6WseHwGOl1onWD74n3wsU7o
	 yfOJF1YaMVa/RZbTgWSN+xW7VEC6/+YI+YqoUf46ncZ2qTP2DOmqRemE2HxPmXLnSK
	 xhNaQ7QVkXqE00lq+RnsFeu9QMYziVNhyPtNE2qX8dPPrtgWK9+PdloU0t8vwAKQHE
	 9W0TRDBK7T0MgpZrmf3LE8znLgI6UYT/ZrtVt8I+T7L/srBU1xI8yuwacbwc1Lydg7
	 1kA1MG9ymiI+aYy0HUeIXR6c8ilY22qGuKfUoCpkqqN1gKSHPyWWRcNeEMasEQ2vpn
	 n1CSoM6oXBtmQ==
From: Kalle Valo <kvalo@kernel.org>
To: "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [regression] ath11k broken in v6.7
References: <874jfjiolh.fsf@kernel.org> <87frytg7b8.fsf@kernel.org>
	<878r4lg3t8.fsf@kernel.org> <87jzo13jmf.fsf@kernel.org>
	<94150b26-bdd9-49c2-82a1-26ff46c9d32a@leemhuis.info>
	<87fryp3he0.fsf@kernel.org>
	<0253854a-e5f9-4316-bec3-61aaf3ebfd1a@leemhuis.info>
	<871qa0xtk6.fsf@kernel.org>
	<ccbb3aeb-daa1-49ba-b729-964bd97748bc@leemhuis.info>
	<87r0hvta9a.fsf@kernel.org>
	<0c8e379b-91fa-4e02-8758-aeee01024c93@leemhuis.info>
Date: Fri, 02 Feb 2024 13:34:37 +0200
In-Reply-To: <0c8e379b-91fa-4e02-8758-aeee01024c93@leemhuis.info> (Linux
	regression tracking's message of "Fri, 2 Feb 2024 12:29:11 +0100")
Message-ID: <87mssjt7zm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_033443_054529_1B9F80BB 
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

"Linux regression tracking (Thorsten Leemhuis)"
<regressions@leemhuis.info> writes:
>> One more question, I promise it's the last one :) When using the Closes
>> tag in patches does it matter which URL is used, either the original or
>> the duplicate? For example, do these both tags close the issue:
>> 
>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=325423423423542
>> Closes: https://lore.kernel.org/not_relevant/msgid-423423423423423423/
>
> Yes, you can use either or both of them together to make regzbot close a
> issue and it's duplicates. But to make Linus happy I guess he'd prefer
> to have both links in there, if those are reports from different people
> that contain background information that might sooner or later be handy
> to have at hand.

Good point, I didn't consider that. I think I have now a good grasp of
regzbot and I'll try to use it actively from now on. Good luck for the
rewrite, I hope you get it finished soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

