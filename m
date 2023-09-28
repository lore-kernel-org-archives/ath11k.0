Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5BDE732DB
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H4GUy9F10Rm4EmCoucusTNMP6kOKobLMCAElfDDaSwE=; b=tanK07dqbfpFmA
	sQGulLPYKPkOfeeehptzZCyAQK6MdIMSHT5MrH+iYhSBrb/4403W6JUCHaVyGcM6BM4mvg/mObmog
	tgaUTzLEMmjA1fAu+gSdnT4+XjJulHXjHHEtIx7x489+fCcOFZ10Nf/XMgXgz5f1LnJzrPqVTe9x1
	3KemENHpeFUc/H4ZxAFNYd7XpG7hBCZWb1s14ddi1XjOLGFwNhl7KFLIlWz80UxFVN5hKuCFrfc6K
	J5OLayBLTwQ4qN/JKObA/gK5dY7DRDfI/H8U+wop11ED8eAEov4YN38ugoU84yFVWNwcZEfDB0pVI
	feiBDd6e0wxW+Vhr6+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrxi-004qaD-3B;
	Thu, 28 Sep 2023 14:25:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlrxg-004qVl-1e
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 14:25:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 904BC61BC4;
	Thu, 28 Sep 2023 14:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888E9C433C8;
	Thu, 28 Sep 2023 14:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695911146;
	bh=SscX0eVTadFaC933RGYn5MMrw3xERy23VuqySk0yQlg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KFHUaYkuvUth8LZbhakdv9ORlVLuVTqBg6mUa5xLXFIJcGFcjUwEr3JMzwgfHzbpu
	 p7IxER2pMPwRN8hC9XD2XdF0lrptzBMjlB9Bz9roQtwHnnnjceE3UpCwXszJlcB3Ow
	 7olK7g9nxNkr9QzZCWTfNLLehvQG0jyNdiWFqrwPYMgbBiPu7xyk7GegHN12kbWT57
	 3gKngEuQQKy5Kc+zouuxunmXZpaFruBkQWcZDOR7PoR0SaWqoPXuywwyERI4yHe2jO
	 kEtwvYMP3NNznqByq7ZOy2oH+x6OuNcAQVtR0gBOBxIrwPtGQjegBK79Mm3iJ6wbbg
	 hIKq0Oxq8doQg==
MIME-Version: 1.0
Subject: Re: [PATCH 4/5] wifi: ath11k: use kstrtoul_from_user() where
 appropriate
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230824075121.121144-4-dmantipov@yandex.ru>
References: <20230824075121.121144-4-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Tom Rix <trix@redhat.com>,
 linux-wireless@vger.kernel.org, lvc-project@linuxtesting.org,
 ath11k@lists.infradead.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591114235.3019228.10330000472453318996.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 14:25:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_072552_618069_28C24BDF 
X-CRM114-Status: UNSURE (   5.33  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Use 'kstrtoul_from_user()' in 'ath11k_write_file_spectral_count()'
> and 'ath11k_write_file_spectral_bins()'
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

458f66c30df2 wifi: ath11k: use kstrtoul_from_user() where appropriate

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230824075121.121144-4-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
