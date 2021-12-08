Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFD6C433F5
	for <ath11k@archiver.kernel.org>; Wed,  8 Dec 2021 15:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9r+VLWzBps6xZg2wuV4CjKGLRyuVkUQZM7h0HDd48XM=; b=sAz0MQVUJTXnKZ
	N6645EMjD0SQHYFk/XR90/CHSNpZ/qYj8DeSWTT7Ngu/FDKF5NUbPJS79Zf0Oj6sFXbgvb8MK3Tru
	KIHFPRjcdEO8rUeR8IExGcaOpsKIiFgeLq18POWbI9ak/oDEJXuq6WComi26LC/2HufUhjMfGmiCJ
	+9DE92tcZJtG6gV6BJoR/sLcsjtCxWm3fH+M3O59p1BSY/m8GCIR/Lv57k6iudismlpy6XZCpdWy5
	Ykxabiag8B6rVhgGNyLa3K1FYnt26tIgkoSjSpBj5k2LV78paYaij5TLTQypBZ3Y4JpI5a5jLdwIf
	vNCEKLrC4upthDydIXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muz4R-00DKkx-32; Wed, 08 Dec 2021 15:41:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muz4L-00DKiZ-LZ
 for ath11k@lists.infradead.org; Wed, 08 Dec 2021 15:41:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C4B7CB82138;
 Wed,  8 Dec 2021 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17207C00446;
 Wed,  8 Dec 2021 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638978078;
 bh=3qaV02N+c2xkdfF2KhkjlcHBGBbrD+nsu321FHilB+g=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=mPYP970hRieP9/dOfgET7o771y+ro9TdCewwKxLihZ63/9d2E2hLTYVS6KsGcxcLC
 uHM5sL+tlBZukRAmkEuAEwXEU0FpW/tgKD9WkDYY92l4mEnRvlrOTfSwJ7APRtAhWs
 tiZREK1FdoWY6fPQP56awNjqEEN05Twwo/S3Itp1Wid3xoIi+Rq8me61liIR5CbEkl
 7t8OmO4nbAWiSZsEoNcY4lEDmk8nVNcsyQ+9JR2ke+BhcrQyEO5eLifQkQ66smwMqY
 6v/kyz01A3ohP/6HJo8hUVsjMW+PK6OZVXD+XcxXEIZB6EpSFEp5P186KkN8a9FHEf
 6cQHjEVFodEMQ==
MIME-Version: 1.0
Subject: Re: [PATCH v9 1/3] ath11k: switch to using ieee80211_tx_status_ext()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20210404125235.5589-2-pradeepc@codeaurora.org>
References: <20210404125235.5589-2-pradeepc@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>, John Crispin <john@phrozen.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163897807415.29276.3770719545792112108.kvalo@kernel.org>
Date: Wed,  8 Dec 2021 15:41:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_074121_909942_7517E586 
X-CRM114-Status: UNSURE (   6.14  )
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

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> This allows us to pass HE rates down into the stack.
> 
> Co-developed-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: Miles Hu <milehu@codeaurora.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

Doesn't apply anymore, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/dp_tx.c:483
error: drivers/net/wireless/ath/ath11k/dp_tx.c: patch does not apply
stg import: Diff does not apply cleanly

3 patches set to Changes Requested.

12182277 [v9,1/3] ath11k: switch to using ieee80211_tx_status_ext()
12182281 [v9,2/3] ath11k: decode HE status tlv
12182279 [v9,3/3] ath11k: translate HE status to radiotap format

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210404125235.5589-2-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
