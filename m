Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AC2C433EF
	for <ath11k@archiver.kernel.org>; Thu, 10 Mar 2022 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiBtB2L8M7ogCXVJrPWbWWND6MF8BXsC+8ks8eW2xaY=; b=BhkIdiQ7UjZrA8
	nJTmaxhR11S5XsXz6lBoSI45h28o/Ote+c9SQvEQoJwaB4nkW0wh+t7eUssQOyMeMWJGB+dn0QO4X
	6p0LM8mcWEKIBsCKCn0k+xWWDonpKM8eNlHQUNobl/QkJnokyttWxoE/zJCdiuFverbWJm0Sjiey7
	epIl+MTPkMPaj3yiLvqRQfR8b8eD304NDoCFpu2gjWXkaBn42U79ETZroTT8uiN1U6NomdHdJ40/D
	t7t85bqlpi8jsDOwFcoRpwjXj9w5HHupD9vOjiXUDU6h1YeROLuudLKqYuBpi/Byrqk5bTjeQfrU+
	2ZRUKzCSpKxYsGO+cOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSL4z-00DQ6E-GC; Thu, 10 Mar 2022 15:51:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSL4w-00DQ5V-3o
 for ath11k@lists.infradead.org; Thu, 10 Mar 2022 15:51:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3CAC9619C0;
 Thu, 10 Mar 2022 15:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2D8C340E8;
 Thu, 10 Mar 2022 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646927508;
 bh=fDncGPJcRJVwshm603ffeV/SxF9a2whRf+pP4u1JBl8=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=WzmMnWO86JdzfXeSUkY5GL6hMokbLHjoyDE7uSZHEOjDqMorJp0bB7BVh3fTBp/da
 8tNLjbHKVKWjur1yEYB8zi1I9woRT1LUrSb26jTo6aa5n3gmF1wxzgIxG4x4BUDF0g
 g/Y5SSWQPpGDQ9Hjq2kqRJfncbJPHzXuT908OqGSDs6Nz2ha+YHrrvgb+kBuAKpoL9
 mDnuh7vD6ihJ3hxSQh9BvJjCAjGNdjCzj+ykT0V0EJT0VyNwO+WBOd19DOZSnIQYZ9
 so7nCNmhBaFeqrwGuP/x5PtV1aQM+x5z9STl0Wwz3RN4evV0htjAQDTGzXuldxulew
 0Wd1aqtmispkg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: remove unneeded flush_workqueue
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220301013246.2052570-1-lv.ruyi@zte.com.cn>
References: <20220301013246.2052570-1-lv.ruyi@zte.com.cn>
To: cgel.zte@gmail.com
Cc: davem@davemloft.net, kuba@kernel.org, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lv Ruyi (CGEL ZTE)" <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164692750437.18489.17708219137652842417.kvalo@kernel.org>
Date: Thu, 10 Mar 2022 15:51:46 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_075150_224080_D55CFBD9 
X-CRM114-Status: UNSURE (   7.30  )
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

cgel.zte@gmail.com wrote:

> All work currently pending will be done first by calling destroy_workqueue,
> so there is no need to flush it explicitly.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi (CGEL ZTE) <lv.ruyi@zte.com.cn>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

57fe207f752a ath11k: remove unneeded flush_workqueue

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220301013246.2052570-1-lv.ruyi@zte.com.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
