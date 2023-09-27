Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076E3E80A85
	for <ath11k@archiver.kernel.org>; Wed, 27 Sep 2023 05:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e53kyPOxguj7Y47jqN5L2k17sFLIwks6GggYZMfLIV8=; b=FjYqIOwjKTP/IW
	XvePgyecA2wHZfInmLuW7LIUa13McBFCXfvUbk/oIEjagzgehHTIBOj0m37c5x6SwK6o7R1fxRTtT
	U2MZkmgMz+9eg2I73IkUH/9G+yZloEHlnI5fd9LgfBDM0tVcxkuZiH6hd+rd0xTSndJEqfS4hHXm+
	7S0AsprLW6IXG2wmmidi4jA8JFSwvO3HSestNFfSqURLznOX9Ij2TBRUWWWAn9BZ9H4NHjonDmaMX
	KaoLSJf5FckaP4lVXi1oWhzFj0VNOfxDtLdAMdVMq5P8f/Wg4oRZ/DBPdl7Jfa8edJjMG3JVn/jiA
	4edRt3wfHOCLVHcQPDSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlMoJ-00HZbf-0D;
	Wed, 27 Sep 2023 05:10:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlMoF-00HZb2-2W
	for ath11k@lists.infradead.org;
	Wed, 27 Sep 2023 05:10:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29C4F61644;
	Wed, 27 Sep 2023 05:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEFAC433C8;
	Wed, 27 Sep 2023 05:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695791401;
	bh=3pSV5XDCtO13XD805MCW3In/6s76oMfmdYsUpvAdOyM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AK2QOuvcVVw+pxKtJ84KNEyQO4DNRx4GB5YCYP06T8SLD2mf6jjJ4IQfeaMMb/J5f
	 X6vUeOiVGJoajSD1nVB6aO6APV9I5yQlWclpG3CyEmYPMQVIklnBExfb/EEnnjCVoY
	 ppCPTfkZn2q3ChU4DJJBACwNqLM4JWQQte7zKpCJxV0CItSS7fV9+zAk4ynrgPLBtI
	 muiRGpMOd3isP2+Tnw+22Mo/FXyhH7w3Po+qTer4lUPr5G5ZN5WEPZ5hDSBI9hIKfu
	 AOK7/1Zp6iaADKdoLNhq/OrhpGu3t5Xcjlsyu00DVN4T7zBCaBIa/puN1kyOttAQYn
	 6Nm70KrZvwI7Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
References: <20230926163350.2641064-1-kvalo@kernel.org>
	<70a75205-8f27-4e73-9d32-d92b6f7bec68@quicinc.com>
Date: Wed, 27 Sep 2023 08:12:04 +0300
In-Reply-To: <70a75205-8f27-4e73-9d32-d92b6f7bec68@quicinc.com> (Jeff
	Johnson's message of "Tue, 26 Sep 2023 13:55:16 -0700")
Message-ID: <874jjgjj2z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_221003_866478_9CB0A109 
X-CRM114-Status: UNSURE (   8.75  )
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

> On 9/26/2023 9:33 AM, Kalle Valo wrote:
>> From: Kalle Valo <quic_kvalo@quicinc.com>
>> Commit e8c1841278a7 ("wifi: cfg80211: annotate iftype_data pointer
>> with
>> sparse") added sparse checks for struct ieee80211_sband_iftype_data handling
>> which immediately found an issue in ath11k:
>> drivers/net/wireless/ath/ath11k/mac.c:7952:22: warning: incorrect
>> type in argument 1 (different address spaces)
>> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    expected struct ieee80211_sta_he_cap const *he_cap
>> drivers/net/wireless/ath/ath11k/mac.c:7952:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *
>> The problem here is that we are accessing sband->iftype_data
>> directly even
>> though we should use for_each_sband_iftype_data() or similar. Fortunately
>> there's ieee80211_get_he_iftype_cap_vif() which is just we need here so use it
>
> nit: just *what* we need

I'll add that, thanks.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
