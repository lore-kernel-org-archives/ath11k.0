Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E79C7EE22
	for <ath11k@archiver.kernel.org>; Thu, 11 May 2023 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eg3uIyyhUeLLMhqKhzQYGI5Y0zx3U9uPhRShJZfb72Y=; b=tvDL7u5NIV2Ye/
	QSlyJRV87FzeAoxmO/Tdp3MoLDLVZDgCldeOdK0++82+7qNiCG0PAdXZI3FajZlKRl872whs1B88o
	3OoZRFZL0pPCWDXNK1SaS5jbZwzxFXNXfge6+nrjPGi74319+mgb763Qt2kkqBKH+Zoye1asUtApD
	lytCxPeCIdmyZ1nVr7jmcppJ5RRzlirLNi0ypkXmpZ3GsHN3rcdnjMTmANqSaPug0lk2Kaf9zfDl1
	86kFC3iAE7mMDdosp13TG3MmpOW+jCgC48fqK85Gvnn08RxZvLVte1FBpR/TNrlX4RTGznbdXIoz0
	DP6G5xVTBu4V+dNWuL/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px3HF-008Pv8-2v;
	Thu, 11 May 2023 10:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px3HD-008Pui-2C
	for ath11k@lists.infradead.org;
	Thu, 11 May 2023 10:12:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A43036413C;
	Thu, 11 May 2023 10:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100A2C433D2;
	Thu, 11 May 2023 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683799917;
	bh=dokak5xIAJZxcGoevw3MS07l7wTn95UjyFXCNSaKY+I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AOZhyic38v+mpA+GH4Fmp9E1Ou7XkzowMk6khvvBXxac17O/IQz0YI8mmhvGGPPV7
	 RjKtyQe38lTd+o0CcnyzXEgKy9RBHj6xn3MlT02mGn+Fa3pkMDxYFQUTOWzmMYDih8
	 OkeEGv8yheUVXSD84uWEydrWeis+czGm9Rx1tQnK3D6ZRE5Zf52lD0EnywevJ5NxIE
	 evqOMD/cLHzdZh/9lFPdfHBYvsX7mPUfQFJCKSG4ymVx5J4CZMqIKDkBUgBtw0X6Md
	 jUU2A8/WRc4Hlbz+Sw4OolF92Xd2vn5wYs6R2JW+DG631I5KIvg61WcCKxYWMHfcki
	 aOJzOGID/F19A==
From: Kalle Valo <kvalo@kernel.org>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/2] ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
References: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
	<a409ded2-f6e5-bc74-3fdb-231a92d9bde5@quicinc.com>
Date: Thu, 11 May 2023 13:11:52 +0300
In-Reply-To: <a409ded2-f6e5-bc74-3fdb-231a92d9bde5@quicinc.com> (Maharaja
	Kennadyrajan's message of "Wed, 10 May 2023 15:35:20 +0530")
Message-ID: <877ctfnpnb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_031159_783171_5AE4D5C3 
X-CRM114-Status: UNSURE (   8.31  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> writes:

> Ignore this patchset, I have sent the v2 version of this patchset by
> rebasing it on latest TOT.

Why? I had already applied v1 to the pending branch without issues:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=e3fd9d322448ee29c65a30e9bedaed222d7548b9

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=b7c3ee0ddc2bf3ecf511793aa55622a9aa62e420

Is there a reason why I should take v2 instead?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
