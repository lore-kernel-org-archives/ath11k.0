Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AADEB64DD
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 06:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TG1DPL5FdTrgCaaugiLs2Zk8TtmmUGSoSarW0ukdYEY=; b=RkvmMMwrs5uxq8
	sXVdiEh3oGpYon2hqtqCHAUQrq43AX4t2CLncEgH0YvpscPdHExqUhA+Mb1CyJQz2etCOhS8TfgiB
	2Rmcp+EKzuVfq/DZvwHvduQGIQwzjarUhV9vv5uNzGkOoIxg0+uTRccOaVWQBznfDy5nDd8HP3Z7r
	Wr3RdIlHovYRSiIod7Vg36qTxAdNhBHMhDXQDo/PPzQiFxOar23qXw2hwFbCwLfYBaDuHtaPmdj+r
	KX9aFZ+gxR7QKRbqB/dVFAnkOSkJTs6J9wHdJK8t0EG3D0bl6ZgFuNguVzfa5AT06aSVNIJ1jWpUf
	MG8G2z1DeTbba1E7Q4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuFG-00CIIf-1g;
	Thu, 27 Jul 2023 06:13:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOuFD-00CIIC-0Z
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 06:13:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A7AB61D2B;
	Thu, 27 Jul 2023 06:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965BAC433C8;
	Thu, 27 Jul 2023 06:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690438381;
	bh=OAvI6XopJNi1Pf1KeGKriGVhqxH7EObNZwlGc2oTbuY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=OZOqhfD8zNOLVPJlMCo41bDv4ViHZ3ibINvG8b2uJwFThMZm8GMaxlDkXC5ivd1yr
	 fRnFPt6UylbmGfvkVyE7ScWVuLIR4MMAdP/6L8VmmKIS/MY76+2avyY6JTRMzThHOK
	 ihE1F/9HD2O37/2tFZgmtVjiauWDZALqqwCYNzozFYGtKiAJVHKg924Ii0svy2l50v
	 hAkuwrN2A7z+qZkgfanAOoc1DSWbXqwybWcCAvJ+1xWz1ssDcDhOKjL1Ud8BQjiWil
	 3/GY/IWy/uET9jcKO82MAuJR7hfbEC8fCwgXQCO8uMuftw2N4GYrnE4WLyL/9kb/eI
	 Sq6JcDZ94u2Sg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Aditya Kumar Singh <quic_adisi@quicinc.com>,
  <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix band selection for ppdu received in
 channel 177 of 5 GHz
References: <20230726044624.20507-1-quic_adisi@quicinc.com>
	<8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com>
Date: Thu, 27 Jul 2023 09:12:58 +0300
In-Reply-To: <8fe1a927-14da-445c-4c48-e3f4b4c324d4@quicinc.com> (Jeff
	Johnson's message of "Wed, 26 Jul 2023 09:54:46 -0700")
Message-ID: <87bkfx287p.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_231303_281475_3AB97374 
X-CRM114-Status: UNSURE (   9.61  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 7/25/2023 9:46 PM, Aditya Kumar Singh wrote:
>> 5 GHz band channel 177 support was added with the commit
>> "wifi: ath11k: add channel 177 into 5 GHz channel list". However,
>
> I'd use the same syntax here as in the Fixes tag:
> e5e94d10c856 ("wifi: ath11k: add channel 177 into 5 GHz channel list")
>
>> during processing for the received ppdu in ath11k_dp_rx_h_ppdu(), channel
>> number is checked only till 173. This leads to driver code checking for
>> channel and then fetching the band from it which is extra effort since
>> firmware has already given the channel number in the meta deta.
>
> nit: s/meta deta/metadata/

I can fix these in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
