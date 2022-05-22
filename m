Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FFEC433EF
	for <ath11k@archiver.kernel.org>; Sun, 22 May 2022 12:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPce1j968TMWCXuqoQmJnV3quhOXFoZRuqzei2yk028=; b=qz5hwdGNpi+VGR
	26Tg8CSQwAVAvIezWw3DuwIhodBJlAJ0VYfoBB/+eWN2DYyrLwZEgS/WJLbL1+VWXkuOjZEtC/+3u
	o+9p1vyDVOC/eYVcE37M+fJ805h5+lGc6/dw5Vvlxi24GgvF9pDMpKG/B3R8m9D/mjFqsfiFbvF0U
	3afSeH/vdVL1QqNmVK69McwhOHsolHdjiik38K30dk5tmp2jVO9fWLKYDUk/k8PLKMkV1yBfdVx3i
	fSsJjX0vI4yzEqbRshqxbDQbd3i3bLFtfCoVVs+fh/B+53fRmhAh166BZjgOyqVkdQQuHklJGDDq9
	1UlgCmKjhG9gJsXEK3Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskhp-001KEQ-F1; Sun, 22 May 2022 12:29:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskhm-001KCb-PW
 for ath11k@lists.infradead.org; Sun, 22 May 2022 12:29:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E84E260F7B;
 Sun, 22 May 2022 12:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D59C385AA;
 Sun, 22 May 2022 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653222545;
 bh=TTwbaWYmNhgxiA2PEesTWAdjhrl9YmH717xkWYfvxco=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=oWGa0P0xDhe/Utv0yFmPrBBhs0UnOj5pEKQ3eW0m4WUtLm/Wrpn0Z7L1vj4xpyIeo
 dhhMDmD4hDKX0UxE2zrl/qWWGchYg7vV7RG+F3eu1iJzW0EftDsSPHoCLOodEnWZyW
 4+adJ30P7ulCPoUk5OHHcsXrcuHlpdcHi0Mr0cpJ3TWq+VxDzDZ7fNSKEDmBaHN9uS
 OJUz3ay3xv3GyzaBPbewPZexjgk8GCctk4Nc9fuJM8TNE92tGG7WV2eiDicrFe4Ln0
 r0JOmkcRlvyU/9seAPilsWPIFxr0+qkMKwjYcTbyyoEz8NQ373I3U2kLTz5777zcL9
 qcOTmB4FYmgdA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix warning on variable 'sar' dereference before
 check
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220517004844.2412660-1-quic_bqiang@quicinc.com>
References: <20220517004844.2412660-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165322254267.774.12155186929267464272.kvalo@kernel.org>
Date: Sun, 22 May 2022 12:29:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_052906_899927_C6C12BE7 
X-CRM114-Status: UNSURE (   7.00  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> We are seeing below warning:
> warn: variable dereferenced before check 'sar'
> 
> Fix it by moving ahead pointer check on 'sar'.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: 652f69ed9c1b ("ath11k: Add support for SAR")
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

77bbbd5e0ed3 ath11k: Fix warning on variable 'sar' dereference before check

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220517004844.2412660-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
