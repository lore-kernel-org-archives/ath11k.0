Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA02AC433F5
	for <ath11k@archiver.kernel.org>; Tue, 10 May 2022 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tM9Pn2UxG6RdpDjlwA+JkHTtlVsiw4Dyf8hx+Io4ky4=; b=4kp5LhEK6W46NT
	wBbR4qQ1BlqnglPrBFuNtiKRSxa4aes8pP3z37owvCcDIUBuhvDz2dUK4dpraWI4uabQUyyzskjuo
	LkqObjN2aXjRkfK4nV6apVaSQrc+dyvQ4Ar+p2YZRRLRYvOqvR7pNUCdCGep2xlVNzYCap576Yb9v
	i2ztfgW3sOvfTK+m32pWO6E3kKr321XOAlkam4Be9avX8lfz91HlW+1MvkJRToNL06ylEvKV02ZMl
	h5dn4+EJN4TZcp01CEPDwmghAueDnyFQXaxph3xwB0FcaWHU+tmBDzmMq71s6yFdbTxcFQs//un9Z
	0m7QpDLf6hIJAsP0sYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noSmg-003781-6Z; Tue, 10 May 2022 16:32:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noSmc-00375K-Kq
 for ath11k@lists.infradead.org; Tue, 10 May 2022 16:32:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FD30B81E20;
 Tue, 10 May 2022 16:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E70C385A6;
 Tue, 10 May 2022 16:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652200340;
 bh=cB8wY2dxDEiVsAOmFZdvZ3VSskFcuAZTQ783Pq/UNMA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=VUkhaSE7EEA9dxmumtqCRg2d+MdrhJs4OW7KsiDZNNwWGv9EYJbrnxLgXK8GbiS53
 mrWtGE8YiFau6lG1mUtTq8bWaIBOA9RaoUluqwavaQppmhWBTQCjelpenl1Rp9PE7y
 62O2hZ+pjxvLhXd4J0DXBOc2ufeazhIgbt7snFcIjoND10+pyraTJQylCMUQtg1fWU
 F21YWqRrjczBQaPfJq19iEtDfYIJ4IK5CWWM5HXTfujWTAVp0E97kZi3SvJAFP8FbM
 wQuwYAeIe7fvq7QtXzlpSt+oQbTrS6qfrxaQKjaVJ9wH6FXoBDIGuQYWrKFw+hT9Pu
 cANE+XVIdjxDQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] ath11k: Implement remain-on-channel support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220506013614.1580274-2-quic_bqiang@quicinc.com>
References: <20220506013614.1580274-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165220033736.6768.15987783390890770630.kvalo@kernel.org>
Date: Tue, 10 May 2022 16:32:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_093222_920113_3668B00D 
X-CRM114-Status: UNSURE (   8.82  )
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

> Add remain on channel support, it is needed in several
> scenarios such as Passpoint etc.
> 
> Currently this is supported by QCA6390, WCN6855, IPQ8074,
> IPQ6018 and QCN9074.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

3a5627b94222 ath11k: Implement remain-on-channel support
355333a21754 ath11k: Don't check arvif->is_started before sending management frames
1d7f514577f0 ath11k: Designating channel frequency when sending management frames

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220506013614.1580274-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
