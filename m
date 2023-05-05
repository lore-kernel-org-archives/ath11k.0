Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D85C77B7F
	for <ath11k@archiver.kernel.org>; Fri,  5 May 2023 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Efgigv2pQQ8RhefTebjkPcjhwYujDhB2SBQ2c41l9A=; b=PlahZA99KJCNln
	Nh4edNBUp3AAufM6LljJyNYs0ENWwxzVAynNSKy3sSy8+lF6R9xA4rV/cnQO+uDQImUYJ8oD7Keia
	4EuhyWweV98wfIkEkN/0KnUcyY+b5hXLsNyhgqWjhh4lphR8pgmwzgnOQEPOusfk3xT6rw1G/GcAp
	iP0ktAIGikxepNcXRLfrNY6Jypwo6ctSXun5KsUgpZ8Gh3dgqwBSrgvi7p5ZNAdDgUpzbXi3K2+0I
	C2oD3KWhhhjhxyNmnzVDtfhA7uIypCmYI37UYmtJMo+5HCWwSwsCsQu/38lGJ7Es1AoNsw4AEUdAy
	WCjEVdsabIeX9DZASpcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvAd-00AxDb-2r;
	Fri, 05 May 2023 13:08:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvAb-00AxD7-2B
	for ath11k@lists.infradead.org;
	Fri, 05 May 2023 13:08:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1018663532;
	Fri,  5 May 2023 13:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26EE0C433EF;
	Fri,  5 May 2023 13:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683292100;
	bh=9c7Vz5IK8FlKc1ixls6ozwZqUCZkz+LKtCLr4XFgz4o=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ly2mEHo/Fnl4oZ00haoj/eCR4VZ38Tmh3QmTlSbrG0I6euToDPFlDJ84kuWX2lbwh
	 /m33W5MRxiCmvuLkSkMnAIPGHaRRloKjZaQiVCNzvTPYRToEN9cMqDFLXIM2bK28xN
	 LkgPoknV/fMtwzcCnjxghUX/K+EHPwop6mAqWJxGwWH0yCQbGzpUoaeQlZaH+mvFyO
	 YwOzFpX+H7EOP20LZ0pPQBVIswo/jAdhql7UIigIVJFJw9X99fVajwjtufxrGKOXJB
	 DYcmtkTzw7CyVU7Ce+ZN947VuWQimZSfyJYAHai/Idx9QXFY5qBVq/nBnWMcLbOwaQ
	 6OJdjp3nA3V6Q==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] wifi: ath11k: Use list_count_nodes()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
References:  <941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168329209643.10223.10625697791625657598.kvalo@kernel.org>
Date: Fri,  5 May 2023 13:08:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_060821_756072_DBACB945 
X-CRM114-Status: GOOD (  12.08  )
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

Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:

> ath11k_wmi_fw_stats_num_vdevs() and ath11k_wmi_fw_stats_num_bcn() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
> 
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
> 
> While at it, also remove to prototypes of non-existent functions.
> Based on the names and prototypes, it is likely that they should be
> equivalent to list_count_nodes().
> 
> Compile tested only.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

91dce4091433 wifi: ath11k: Use list_count_nodes()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/941484caae24b89d20524b1a5661dd1fd7025492.1682542084.git.christophe.jaillet@wanadoo.fr/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
