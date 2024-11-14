Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06424D41C3A
	for <ath11k@archiver.kernel.org>; Thu, 14 Nov 2024 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz6GQ6XTm1E6puM+6N6hrkyw3YnPU5b2VQPyKwD2oFI=; b=jZ+XXNHB18eP6j7VbkZlr6Ymgz
	p2JFuCvZ9EckQX4JOGbTOKCE4YM/6qBu19qUeaWrYRmjYN42hC1YkDAJFAXtS7VQGMNXl/ZrbJUfL
	9gi3O3WccTaRJdJkmv+M7nWVTfx5C4EBrDUk1EDNmhgIYhQ550dga8xg2Rr7belFTig5NRb+xcb5+
	FJsGZNztgOdCF8QeMBe8OJeRhdzzsBkHY3FfKeu0m/3pRRPEAbL52gnh+CsfcHxLwWwHOxa0LxUrX
	kqUHOfmmaStL8lQgnAml+Mff+64S8zkF7hBO/rrZG1bHtauaD1+vxvq+oINIcsUqXPPdKX0ffiXrA
	o2ibET3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBYWs-00000009paG-0Daf;
	Thu, 14 Nov 2024 12:00:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY6z-00000009kCw-2UlI
	for ath11k@lists.infradead.org;
	Thu, 14 Nov 2024 11:34:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46AA75C4D9F;
	Thu, 14 Nov 2024 11:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7620CC4CECD;
	Thu, 14 Nov 2024 11:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731584048;
	bh=aItY16j4fLjubP3L0+j69GJGChn5EcSz3OuryUOJVB8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GlE02iS++DBIjn2Sb7fQzS2AgZgc84iVkvbpe38Z7Bt87G1Rx5PyeqhLhKk7l440W
	 NywP223zwFUteRc/QECV/6ALX0Vkfm0aWbqf+J9qZW9apWoaCn985fVdLtwAKOkUhR
	 mgMwPZbQobrMrDA14hMNIzWYD8jdUte+IfIQEBiAELxZ6rh4wB0sEmKxF8C2LOUKP1
	 34RY8zjOcmW+OcuSTnZOCDQu//6nPTZtcm9NFIsMlPozW5TEEjXF6UR0PddhBTH/eU
	 4pfXiiK70GvyWZ9jXV8e2hOz/h775Z365UPyzN7KsjSNk/bQ0FRd0MnSIs0kBitCyp
	 jcnlqqBpjr9Cw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 3/6] wifi: ath11k: move some firmware stats related
 functions outside of debugfs
References: <20241113015631.3105-1-quic_bqiang@quicinc.com>
	<20241113015631.3105-4-quic_bqiang@quicinc.com>
	<8734jv2xnd.fsf@kernel.org>
	<7917a344-82aa-4ef8-9558-554743c5dd15@quicinc.com>
Date: Thu, 14 Nov 2024 13:34:05 +0200
In-Reply-To: <7917a344-82aa-4ef8-9558-554743c5dd15@quicinc.com> (Baochen
	Qiang's message of "Thu, 14 Nov 2024 14:05:28 +0800")
Message-ID: <878qtm1236.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_033409_709040_90CC016D 
X-CRM114-Status: GOOD (  10.08  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> On 11/13/2024 7:14 PM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>> 
>>> Commit b488c766442f ("ath11k: report rssi of each chain to mac80211 for QCA6390/WCN6855")
>>> and commit c3b39553fc77 ("ath11k: add signal report to mac80211 for QCA6390 and WCN6855")
>>> call debugfs functions in mac ops. Those functions are no-ops if CONFIG_ATH11K_DEBUGFS is
>>> not enabled, thus cause wrong status reported.
>> 
>> What do you mean exactly with wrong status reported?
>
> ah, thanks for pointing that. actually no wrong values reported, since
> we are not even reporting anything in that case. will be accurate.
>
>> 
>> mac.c is quite large already, making it even bigger is something I would
>> like to avoid.
>
> then can you suggest any other place?

I first need to understand the issue we are fixing. Is it ath11k does
not report rssi and signal via ath11k_mac_op_sta_statistics() when
CONFIG_ATH11K_DEBUGFS is disabled?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

