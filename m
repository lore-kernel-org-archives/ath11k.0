Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECB4C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWBNPsjOyzN0BkatzJuQAamCw109X9i0qsg9ek/ie3Y=; b=mavUiwP/nSJNZK
	PZ8HHdUWyfvGfCqscmKokKsZRtYhkoEFwLZ+l2UuRs3q+8fb6R0GNMJH+EodTo4Ebjdt1Bl0m3iSi
	apBZcq7ItpS5aKWF7MlC+K9cXIZkOdyPfF3SYC4TH1x3sg2yve98bYMKicDZKrALKJ+82CnOwfbHT
	CBiac6KDZmiC6EKJKKBlD2+7soy7MZKVj4tVW/ccGkezTpmNXjuZtZumSs4JduM+bSUXNoXQlrRU3
	/mvLzndYHWaNiHnlG+zosegyQ/gP0/Z9iQxpuWfKldLG1HmSCpuxDCAblPnEaq77FZ9vfsNWjMxc3
	VW3lrV/3HDYhQLYTKzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNdm-00H5IG-EY; Thu, 09 Dec 2021 17:55:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNUE-00H2t6-Ey
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:45:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13ABFB825C9;
 Thu,  9 Dec 2021 17:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1279EC004DD;
 Thu,  9 Dec 2021 17:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639071937;
 bh=sOPG7Ro7hQwxUmAvR3WADdiFHvMn+PUc1oXzint7T88=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=iGU1nInaquYuRSEM4IC5BZ8v+huPpxrbID07wnZplb62gzKxnakGUgkA4lhFI5VXp
 uzE8xZseVa3fcIV7m6lY006ssTsOwSr/2WqPS+k0tEyA1ryhga96ohBlzMWd26Ri2e
 mlFPmCN6gJJUQDnmLVU8n395fhS47pvtmVRmKp9l660oNMwcDDkDo9OAmzo53mQY2S
 eTuywR7UTF/4AVTZ6Xxmjf/S6UOfLZ/GL3Uz4Rkf5wuIZDgLtkCTMmal92Roh9IvoM
 bG/JF2e0hxeOU6QyVpyxgZhxATvk0EH3r9aTfOFDkBrZwwEjSQXzOg7vnvrzGlLC1d
 Bx9PStn/z6h1g==
From: Kalle Valo <kvalo@kernel.org>
To: Carl Huang <cjhuang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH 0/6] ath11k: support WoW functionalities
References: <20211011193750.4891-1-cjhuang@codeaurora.org>
Date: Thu, 09 Dec 2021 19:45:35 +0200
In-Reply-To: <20211011193750.4891-1-cjhuang@codeaurora.org> (Carl Huang's
 message of "Mon, 11 Oct 2021 15:37:44 -0400")
Message-ID: <87h7bhvfi8.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094542_685471_0E278F72 
X-CRM114-Status: UNSURE (   8.67  )
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

Carl Huang <cjhuang@codeaurora.org> writes:

> Ath11k WoW basic funtionalities are merged from ath10k such
> as magic-pattern, PNO, disconnect and patterns.
>
> Hw data filter and pktlog purge are required for ath11k.
>
> ARP and NS offload, GTK rekey offload are new WoW features
> implemented on ath11k. 

Had few minor comments, but this looked good. Next time remember to use
ath.git master branch as the baseline and use --base, makes it easier
for me to apply the patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
