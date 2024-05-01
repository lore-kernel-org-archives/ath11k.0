Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8C7C4345F
	for <ath11k@archiver.kernel.org>; Wed,  1 May 2024 05:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iymhg++Vu0Ix3AQ/Zs1j01bsA4GzE24sZ1XG8lHZeJk=; b=kFv2VyNMhyIFMPt+YK342hIIiF
	FkSAQzs+BI8QTfz2kNvR6U1Xoe6QoAiOJtFDtTiTm3H5PMzfzmYSYXqFCG/5pdmuodWL5yKnDWzIx
	fDnGlKuBsr28SbyzmvZBYg9E7j0xsdjBvYIMnnPu8JnfcyDlKPMlgg0xw3uXhzybqQJTGsa8MuDaV
	M9AwlV1uRt9apCytnalebawfm2sE534pXr4GSaqKePaabSHeOynKD6ehc/UWw2w7RV+CYPpPNB9kK
	0gX+zsqUCbyGYfY7I0NVcNIIdMArlSXGrqN3aWuxoWAvVhi9Yfdp0y3swD00ZuABgRjpdBmZ5Rm56
	QwT4NmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s22Mf-00000008bSq-1bTh;
	Wed, 01 May 2024 05:18:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s22MX-00000008bSG-1lMa
	for ath11k@lists.infradead.org;
	Wed, 01 May 2024 05:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3BACACE0E8B;
	Wed,  1 May 2024 05:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05816C113CC;
	Wed,  1 May 2024 05:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1714540714;
	bh=YlhaJhV5my5PPggnaixBtvYw3nwXbX2fL950Cy6rP3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nmY9o5y7bIskT+PcPuxyk1fq3bG3KwqY4ZPI8Gu8KffhP8Gv6f6B3vlB2JSSXNCr/
	 COO6vi9BrzWEF+Ehb06mGuKHtG2OTkO0vOPEtOSH3RwKDt6kskk7jH+4x5+GO0pV4l
	 RuEO3x0FIjr7TLnWcjpAPENqQW08ZTO+lINHRoZA=
Date: Wed, 1 May 2024 07:18:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, quic_bqiang@quicinc.com,
	ath11k@lists.infradead.org, quic_qianyu@quicinc.com
Subject: Re: [GIT PULL] MHI changes for v6.10
Message-ID: <2024050116-petroleum-causal-bdfc@gregkh>
References: <20240501043450.GA5218@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240501043450.GA5218@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_221837_663415_9F5C2DA3 
X-CRM114-Status: UNSURE (   6.38  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, May 01, 2024 at 10:04:50AM +0530, Manivannan Sadhasivam wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git tags/mhi-for-6.10

Pulled and pushed out, thanks.

gre k-h

