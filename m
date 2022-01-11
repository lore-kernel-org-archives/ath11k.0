Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F34C433EF
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 14:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZNwerOHvCKTGkRhkj8tNMh032Y0dVWbnvwkSvGcKzA=; b=Cyvek07gXyjcsd
	ygYEPMdYh/oxf4aaMjyWSkAGgq5e2XGNdS2RCTxnvAU/kVVnYAEdPxio4LckbFF2iaMltw+7+grPD
	tA63Z+g7K4jt1UOAp2Yw+ZtuGh3fglmkpck67WH5dbyoTpklOSC+3W1PuFoyhf9i+4ocRniFW7X6I
	QL7LobdQ3xNqKh2DSpuWA4FrDPGAVwBvA5RrVeUJloHJ382igkC5FBZ74qnglwFjb/BSD1QNVdj3Y
	nd4cE22yZ4sMBii2GWEH7gLSlIN4q4RiFn1KG1IE5J7LxXHDwKYqg7wyqioGxAY8K7zsWtxwBb1HB
	RUqz/hjndcsspl1BMZ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7I7w-00GZED-AV; Tue, 11 Jan 2022 14:27:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7I7t-00GZCu-OB
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 14:27:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6678DB81B18;
 Tue, 11 Jan 2022 14:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDE7C36AEB;
 Tue, 11 Jan 2022 14:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911271;
 bh=q7UrMOAq8uxK4pV4AeXczZ5Zom8qNHsblmQ/HEPUX/g=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=n3OjADGKqB7/yC+wlxG7zH38DNNCQcblNg847B5JPFHcKHBedmoVjuZAmd9Mnu3HH
 iXFd5+3QjSzcOZn1261lbuyuRDAxgxolfJj1ZOPC3nH4yHDGXgMB0NWhSPzlPf1DQ2
 aInu9rqgcz+wR/NU9bIn1/8PZnakU1iNSErYgZOkMJcCmaScAs2c5YFyGEpQXPW9jO
 c+0wKjGiKrKoTCApFoSvB9MXGnngpzwO5bmCEmOTzyjNYbyaFuQ2+Nmqe9Ha7lqSsd
 D+jTv0aqj47sNMhMtkmNJOjIcNEjUOpwNX/Tf6g6gURE1rmnHeJUCNi7GvCn6YBS8H
 GcQJ3bYQhBpdg==
MIME-Version: 1.0
Subject: Re: [PATCH -next] ath11k: add missing of_node_put() to avoid leak
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211221114003.335557-1-yangyingliang@huawei.com>
References: <20211221114003.335557-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164191126809.24158.10097553913442842194.kvalo@kernel.org>
Date: Tue, 11 Jan 2022 14:27:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_062753_961702_C7CFFE5C 
X-CRM114-Status: UNSURE (   7.54  )
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> The node pointer is returned by of_find_node_by_type()
> or of_parse_phandle() with refcount incremented. Calling
> of_node_put() to aovid the refcount leak.
> 
> Fixes: 6ac04bdc5edb ("ath11k: Use reserved host DDR addresses from DT for PCI devices")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3d38faef0de1 ath11k: add missing of_node_put() to avoid leak

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211221114003.335557-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
