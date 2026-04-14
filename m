Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB2CF9D0C9
	for <ath11k@archiver.kernel.org>; Tue, 14 Apr 2026 12:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1udwrSYEoaoUgP2bIJt2dmf8dBn58zMQ1f8UWe8/+Ck=; b=41DvcUqi/zvz92mzHThSQXW11W
	4JKh2SxeV9asbF/+NszOcqUBbJUzUQG3aE8vPF29Veso/oIjoy8g3FxSHzGMmyG/WMth5s/jESDxu
	HCRZBIxJuUuCgLoCO/huko/AQ9d33MdeXt0NOlkG3tTe3h2CGAF+nSmo1TiwU3TvY4+hhDrkoSNQR
	UW3cEVvcZPacJkPSdVZGTiktWM+Ktqdq3NY/olfXsG7qyMDsxN1bYtuNfOiXC7gyZzoP1PwhkifLQ
	+zYuQOlS0vO0UV2cqW54xNKvMrLxg8dryw9b9VOY7Tw2YH+3TP2aDW/S37wkgCMST5P2lD2cXYIm7
	vnyA2ekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdIS-0000000HKot-3lZG;
	Tue, 14 Apr 2026 12:55:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdIP-0000000HKoV-4Ake
	for ath11k@lists.infradead.org;
	Tue, 14 Apr 2026 12:55:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1776171298; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PcUlMX5UZ9symej9Q+NUSgMdBQRE95LhZbSCKN22rL55eKVxg9WofZ7XmkBBh8qWK2EKHFFZSJ0TN7HVg+xUzzwXQvLcVROo1WDi+bvYCnmZVYqL8D7A7pU6xn/Rlm5J3sWEPeb5wn8QeFMpTrrdA4xHSw9EzfrGzJ/mF3My2jk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776171298; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1udwrSYEoaoUgP2bIJt2dmf8dBn58zMQ1f8UWe8/+Ck=; 
	b=KNdUysAh3VeExsi8JI3xMchc4xzrtlSfYJxKZ96svR08nYjAYk3tNrUyqINq36Ea2UapxFty/uDv2e0xnm5Qv9EAkRqTg+En8Ea7oTz29D3OWInURLL2JVJ/CfL0c0WbGzRF6E3xA6KPvh4+1sQF1RwSxXJI2osXs6RCjmiOd8U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=matthew.leach@collabora.com;
	dmarc=pass header.from=<matthew.leach@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776171298;
	s=zohomail; d=collabora.com; i=matthew.leach@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=1udwrSYEoaoUgP2bIJt2dmf8dBn58zMQ1f8UWe8/+Ck=;
	b=SgVTncjKDekvDRxFkAKPpHpKFYVOeBWK3J+jvXmUULPcERNSKAw3E1J0q90N3BpA
	qjuOycWc0ih8o3vUJvYbKpCkZyrTPLr3h2vzvS9hVAyClbA/2R48I8jUrVkkZQIOI0x
	T4w5EU2sN8JOCZPtIUvu2HbNFE9zoBDzoaL6VaDo=
Received: by mx.zohomail.com with SMTPS id 1776171296260511.12827373228345;
	Tue, 14 Apr 2026 05:54:56 -0700 (PDT)
From: Matthew Leach <matthew.leach@collabora.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@collabora.com
Subject: Re: [PATCH] ath11k: workaround firmware bug where peer_id=0
In-Reply-To: <7dbc3836-c42c-4cbb-a50a-011d82a0ee81@oss.qualcomm.com> (Baochen
	Qiang's message of "Tue, 14 Apr 2026 15:06:33 +0800")
References: <20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com>
	<87h5pxlpg4.fsf@collabora.com>
	<7dbc3836-c42c-4cbb-a50a-011d82a0ee81@oss.qualcomm.com>
User-Agent: mu4e 1.14.0; emacs 30.2
Date: Tue, 14 Apr 2026 13:54:47 +0100
Message-ID: <87a4v54s88.fsf@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_055514_096499_880957FD 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Baochen,

Baochen Qiang <baochen.qiang@oss.qualcomm.com> writes:

> On 3/30/2026 3:57 PM, Matthew Leach wrote:
>> Hello,
>> 
>> Matthew Leach <matthew.leach@collabora.com> writes:
>> 

[...]

> for chips like QCA2066 and WCN6855 etc 0 is a valid value, however
> this is not for chips like QCN9074 etc.
>
> so a possible fix would be to add hardware ops based on chips: for
> QCN9074 we keep the existing validation on 0 in the ops, while for
> QCA2066 the ops is a null func. Or even simper we can remove the
> validation for all chips.

In that case, does it make sense to remove the condition check

if (rxcb->peer_id)

in ath11k_dp_rx_h_find_peer()? It looks like this has been used as a
small optimisation, where if peer_id isn't valid it skips checking for
it in the peer hash table. However, if on newer chips peer_id=0 is
valid, we should remove this?

Regards,
-- 
Matt

