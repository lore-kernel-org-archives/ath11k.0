Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F90C83F1A
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 23:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=oG+Ngb+WGCiXRiz5YGhrfgqAzOddD81UypLXPgQCJMk=; b=vKf0Y4Bwcx4MUA
	FrtqKs/1B1P6E27e2YhZpq8RGwEJHuGMddTh1TDLwcoXgQRC7DIuROiysWtU+6QCp+ldRpNhgUsC5
	HMTl/UazW/yK1vdp4C2P3qDHxR7rDdYXtITbr2qiL0ijhu6gFIxowadQBPael1V3C2cLB4SsthXrR
	0wGVA6DKh3JOPUfdUeUVktGgoYTjjoazfSpXRO9/UNaTe2Co3Yg/MnanWTenIwSDz7MRXIKlAo4In
	SX8QewgRBkMiA3i+fpglxQUlgJ8FPz4fKd8FGwrWQcslx8eF7dhoTgSWbL5xkuPat51CubOOPXvGT
	igdEcz4gU0tSGMea5ZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMlQ-0000000Fzf0-3X3P;
	Fri, 11 Jul 2025 23:02:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMlO-0000000Fzef-3Yk4
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 23:02:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 048CEA55084;
	Fri, 11 Jul 2025 23:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D71C4CEED;
	Fri, 11 Jul 2025 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752274961;
	bh=oG+Ngb+WGCiXRiz5YGhrfgqAzOddD81UypLXPgQCJMk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=syeIDBXDaffdmA7DcgwtYj459mfbugF3AgwlYikU4fCoh31or8C+UvfUZYDvCEmfj
	 qxC5IuuzwC8G5TelfaAkL8b1lOGR0BPcvufaE8zpoI4U7vtxK7Jk3LpzHbZH26yfjg
	 lmp+Eq9Q4YB7eX6U2+DotTGTvDVHtZCvs4yt7BAAlCWajWwlPQdd6z2ChcBMWABQx0
	 4gAdztszDkCoSl0yGRLPqmTw2BZC2Mnw9HkUabLj39j7VQVQ6ep052CrE95p9ebHWb
	 HsWFVtVaiOe7LnYRVhKMufdpgD+yuxCF4GeqINz1IxGiTyJn4ZPAHW6hLPtpxqs/6N
	 kOASnkUPg2i0w==
Date: Fri, 11 Jul 2025 18:02:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
	qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
	quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
Message-ID: <20250711230240.GA2312867@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_160242_949587_CFF934B5 
X-CRM114-Status: UNSURE (   6.61  )
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

On Mon, Jun 09, 2025 at 04:21:27PM +0530, Krishna Chaitanya Chundru wrote:
> ASPM states are not being enabled back with pci_enable_link_state() when
> they are disabled by pci_disable_link_state(). This is because of the
> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
> flag is being properly cleared when ASPM is controlled by sysfs.

Mention the name of the function where this happens for sysfs so we
can easily compare them.

