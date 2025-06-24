Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D9CC7EE2A
	for <ath11k@archiver.kernel.org>; Tue, 24 Jun 2025 08:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3TjG5gxdf3P4J5D4oRBfHY0OkdPZa7IybA7q/STwM0=; b=pHV25gsWqp1c7t9ZpY1C01V4lV
	JVgd8i6w+Tov30t4uVt/Hp2GVGbbPTosVdBOiUJi3vQIGVPubmGDblnA+4KrBgP6PW4xrlWmKvTfO
	EYiU16jrDhz9MmYv3o2qY7vGLxXErV1HViECN2zUpbLhVOy+8zbZ+IvycrPDFIEUFGwtaNxEANTXq
	JAhfL9t4GYX38QRau+hjfNt8hfcNfir4395nBBXi/pocpo1jAWDk29WJRm8dm4gU2gfzW9AYF2gHb
	TtT19ZVQMTNdoBYZG8dfkKzG6gnR5W+3vMzzK93OSL0dtq6NRVsuHMiFy/gbBAZ+26ZviMAUOL9R2
	aG3QnJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzO8-000000055Za-34b4;
	Tue, 24 Jun 2025 08:52:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTz2J-000000051ck-3MkL
	for ath11k@lists.infradead.org;
	Tue, 24 Jun 2025 08:29:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EFEF4ACC4;
	Tue, 24 Jun 2025 08:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF67C4CEE3;
	Tue, 24 Jun 2025 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750753787;
	bh=NNre+qgBo2HMN8+Jr1S9NOMmw/QauNCu9wYpQKdLzfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uThBQTZb8Re7UbI1Jb3i7eOkV3cW+lkM/3iz4taJ7Lh2nEFBZag1E1gvpNF7kAPuE
	 SeO7OLsSRqtCauYeizx2bGip5VQKYuIWxK+U7O5YGxEi9nUVGDv9T1UvyMVjCBNEuP
	 xKMLyL6GTT/n8or4/+sJ0jxDkxAA3AYHO0I3cgR4Fx5LRJzzKQegnS77vdjDxduT1U
	 SuS7T0aQGOlhQ3Z7zlBT9gC4+ATo54f/ANL/jp/mx1XIx4HXtW2Bckvzrp3pbPbuBN
	 MjIjn6rcS80D3P9aAYjUwBS/Wz8dTj4+aCCpnv7bK01fj9+RHfxzuCKfzbEsEnSEjx
	 hQ9E2sIBwQg7w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uTz2H-000000005KK-09sW;
	Tue, 24 Jun 2025 10:29:45 +0200
Date: Tue, 24 Jun 2025 10:29:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH ath-next v3 5/6] wifi: ath11k: choose default PM policy
 for hibernation
Message-ID: <aFph-apaQ2y7piRX@hovoldconsulting.com>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
 <20250328-ath11k-bring-hibernation-back-v3-5-23405ae23431@quicinc.com>
 <d0cd065c-1cd1-4e56-8c57-60777b1f3664@oss.qualcomm.com>
 <51da74b0-d8d3-4520-9fc9-06b50b552bb2@quicinc.com>
 <08a310dd-6982-4e63-9f6a-02bd9d579167@oss.qualcomm.com>
 <5b77ff7e-13c9-4083-9273-b8d3050e5116@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b77ff7e-13c9-4083-9273-b8d3050e5116@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_012947_860710_2FE3F027 
X-CRM114-Status: GOOD (  12.56  )
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

On Tue, Jun 24, 2025 at 10:11:29AM +0800, Baochen Qiang wrote:
> On 6/23/2025 7:30 PM, Konrad Dybcio wrote:

> > [    7.669494] mhi mhi0: Direct firmware load for ath11k/WCN6855/hw2.0/amss.bin failed
> with error -2
> 
> Thanks, this helps understand the issue.
> 
> And BTW, WLAN firmware is missing in your setup, you may get them from linux firmware repo
> to avoid this issue.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git

This is still a driver bug that needs to be fixed. I just sent a fix a
here:

	https://lore.kernel.org/lkml/20250624082022.15469-1-johan+linaro@kernel.org/

Also note that there is no board file for the CRD in linux-firmware
(yet, see [1]), but apparently that is not enough to cause probe to fail
(unlike completely missing firmware).

Johan

[1] https://bugzilla.kernel.org/show_bug.cgi?id=216036

