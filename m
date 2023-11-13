Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA48C4332F
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ZOFRy3ExNxVttLdoqGm22X/1pmSQlBO+LaIDIr05Sc=; b=q5itpGZBavfx0G
	4oK0PVAMRo9ocFcYAH9UPJRSmEehjQ8zVAOgC3a0ZKar2sVywBH+2DV5bdD0fz+GUyzik70v8dE9C
	kW3sIBsAADmyz5NnasiYgFfenH1lKGZjE2LeLZ2TwboOksZYzD2J3C2jg+1fWiHuWROK2qKwYABVX
	6JPvAPDKRIHicDEDjSxFVv5G4VRltnSZsWtPL9Kv7Bx8onXFQQrzs/pqAhuxRrH3GBPFNRGHxWmkg
	ChBgPbpr8+SjgnEbZIA2u3eCFezdQlEmpBii/OfGdsYwSi1gtVfZCQ1xgs0rCJqpcWy3gzkIR5qmj
	5DZFkPYpgfnbh2e3vPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z3C-00EG1z-0N;
	Mon, 13 Nov 2023 15:40:34 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Z39-00EG0o-20
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 15:40:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF68CCE138F;
	Mon, 13 Nov 2023 15:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E89C433C7;
	Mon, 13 Nov 2023 15:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699890029;
	bh=Me27/o+L3cMxmjJ4DypGvAdvLbD9JyC08rfGMLC9mnU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LDW3Q4hkpVQFb4M9wuOMLOx40xmenw7eUVtKcycPtKH25Jj0lLfunw8wqJJL6CVPU
	 EZVdTT6cmCSlTlYcUKZe9ii4wk4GrySMVfiR/yeNAgUGO2xbVr/a9HJclvnqGIfLLS
	 px98/ZDqZevZDgK3GsX1kloTC7C/v6nuyoWbJMKx1+CrdMxLUPkFJcfeY9PIxVgKD7
	 Jt8H9l6TOifbDxy1z3Mcl/krCIzn2qjJruR3ogSdV9N6CzDp17slRWE3EGm4uFK6Rd
	 eLnAcYexgGaryWPho92At5KyctcNUQNvaFCKWFjON0/LTmTHZqr1Gaf+Ng9Wc9dhQJ
	 UI5f3EX0uAZ0Q==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] wifi: ath11k: Remove unneeded semicolon
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231030060225.28987-1-yang.lee@linux.alibaba.com>
References: <20231030060225.28987-1-yang.lee@linux.alibaba.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Cc: quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, Abaci Robot <abaci@linux.alibaba.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169989002541.3390604.14056212470986702410.kvalo@kernel.org>
Date: Mon, 13 Nov 2023 15:40:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_074031_829401_7BBFCE75 
X-CRM114-Status: UNSURE (   3.92  )
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

Yang Li <yang.lee@linux.alibaba.com> wrote:

> ./drivers/net/wireless/ath/ath11k/fw.c:136:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7073
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8f157593689f wifi: ath11k: Remove unneeded semicolon

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231030060225.28987-1-yang.lee@linux.alibaba.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
