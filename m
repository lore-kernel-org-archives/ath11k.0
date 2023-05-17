Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7AC77B7A
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 08:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3A7sFHr9+LHCUsHlbFbB8uwbYK67fcBYvjhEG6ScT6E=; b=kScSfDKqAxOseo
	yFYKIn9DGOifxkGvvKx+K2W66xA+ZF1EKlqNQ8Ue6YNolsoEM0ud7WsNcGw62EPw+ztGZLWbvhlLX
	QcWRdNdOW1E4Vyyg2SA9/3DSA3x8ZFU3GCMFtJzWgNuIDQ0oVVWlSHciDOXCOY622RtnUwGYJEp1u
	3tU33oicYM8NqvrJ0htYVsH+acoegHoR+a9irFljQwgPqc5xVg6hCirB/EnT8DAqn6FMuJsK7hjBF
	DBg27XEmmJ1UDTscaR7h3W4cPgO0zmQ1iwC9CED/NEGTTc/UEwN3O3yMN/0PBOyOwMdVW8Ako9JBV
	2BepuPzd5eoxatQ9bi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCNM-008p8L-1e;
	Wed, 17 May 2023 08:19:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCNJ-008p7e-25
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 08:19:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27D0061534;
	Wed, 17 May 2023 08:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFBFC433D2;
	Wed, 17 May 2023 08:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684311548;
	bh=La1MuPZ/2qVLr9ylXbwJw83v1motV4uLHA32QcWjphE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pjkOMK8mjdsHwGQyCnyWrhd6uJXdle0Ld1hUetsbd/kNIZ881yzN6OuiwIHCyaWk2
	 mbkXyp1+NgjXhq7V9ckLvkWgF5BPzHs3LTT0E+1Q2PkVYhFgDySdLOSBxOo2l0MwgU
	 l6TOwXmCURxKIGmGeNGffpW9GJGmThPImp8GEldf7DhZ5wrwKCm23KSp8Io28+YmpV
	 OwXAkd5v+TvtboC7cjYDolOzFLSQMQG1532WpOvbLOjf4YO2le1esNXvxxD2UOgkBk
	 Bc6RMwja1WLZ6pvSXlRBbxse4TS18T9d4b52m4pDNDK2iEqHp+VgQwj297WBY/fR+0
	 H5wBFCYSOu8NQ==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Relocate the func
 ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
References: <20230504092033.3542456-2-quic_mkenna@quicinc.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168431154238.15787.9973143615337740761.kvalo@kernel.org>
Date: Wed, 17 May 2023 08:19:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_011909_750654_8E93E42B 
X-CRM114-Status: UNSURE (   9.20  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> wrote:

> Relocate the function ath11k_mac_bitrate_mask_num_ht_rates() definition
> to call this function from other functions which helps to avoid the
> compilation error (function not defined).
> 
> ht_mcs[] is 1 byte array and it is enough to use hweight8() instead
> of hweight16(). Hence, fixed the same.
> 
> Tested on: Compile tested only.
> 
> Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

570eec3d4050 wifi: ath11k: Relocate the func ath11k_mac_bitrate_mask_num_ht_rates() and change hweight16 to hweight8
df8e3729ffc0 wifi: ath11k: Send HT fixed rate in WMI peer fixed param

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230504092033.3542456-2-quic_mkenna@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
