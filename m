Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3F1E7717F
	for <ath11k@archiver.kernel.org>; Tue, 17 Dec 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L6ro/dPVM1xIIqywePkia8CAEFjRHPddQMMlHewnsSA=; b=he8+YdglpxOu5DYdqksNY8EYr6
	fhoNiZrz7bfwn9vx8AjEwYs0uWP4ONmjXLOqQUUqf15kCNzfGjOTHD9rxGwqJhdG8pXGJky0uonJy
	QWyDvw4jHZh++ZiQQ8yaEhXW6HIFHaf4jV+RoCIknSQ7JJv9+6MGgKizwXNJ8/jlOHIGJmIeaZg/u
	ugbAXm6cAGcitnRiO3t4+S+nPKKA7QDI86nNJaT1f4BrAeS8jg818RF/x86gCGLu4Rign/mqxd06A
	T2NQIXYXYTEvGm4Ew694IUET3sRyv2d773Af5bBKTDariKaus0kS8hCyAe+zvUx+7jIWeHQ+Em7Lx
	BT7ra6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXy3-0000000Ddl0-3O4w;
	Tue, 17 Dec 2024 13:50:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXy0-0000000DdkN-3LvR
	for ath11k@lists.infradead.org;
	Tue, 17 Dec 2024 13:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29B09A41737;
	Tue, 17 Dec 2024 13:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2641C4CED3;
	Tue, 17 Dec 2024 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734443427;
	bh=L6ro/dPVM1xIIqywePkia8CAEFjRHPddQMMlHewnsSA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jS/IKLraMi3i3HojpHryX2WTGxWyEFN4KPK58gUZ5PLwotaw/LjLBTLQ7RkrdXqzs
	 6GuSe+Ve2umXcL9k/7GCzz39KrSqf6W1dTGs5tJ7ZtKwQQglZEAs9qlZIsuMcAffUo
	 UIxDoPSRvaYZnnLorxwN7yvDVtxb9SD9EGMPNDLIqH/YFj2IRwJjJ5xxlwHDNDi5Uk
	 SWid9FtRdwxwJ4b0WlA4vpyBTYdUifc93azKOcFFyVkJRFXDAxyDx+TYPV7CK7xeym
	 q+8tzLPUc2srRAhGhOZH3I9IZ4ub4O9MdNhfKTa5P1N/NZkrOtcXpx7FmD2dn8n4/N
	 rNue1qismul2Q==
From: Kalle Valo <kvalo@kernel.org>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] wifi: ath11k: add srng->lock for
 ath11k_hal_srng_* in monitor mode
References: <20241008053744.1070-1-quic_kangyang@quicinc.com>
	<20241008053744.1070-3-quic_kangyang@quicinc.com>
	<87ttb9nea6.fsf@kernel.org>
	<79910df2-a7fd-4880-bd32-4f2927341654@quicinc.com>
	<e0d2d1ce-0443-4eea-b3c3-ed7423875d11@quicinc.com>
Date: Tue, 17 Dec 2024 15:50:24 +0200
In-Reply-To: <e0d2d1ce-0443-4eea-b3c3-ed7423875d11@quicinc.com> (Kang Yang's
	message of "Fri, 13 Dec 2024 17:41:41 +0800")
Message-ID: <87a5cus9jz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_055028_911473_8F700F0C 
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kang Yang <quic_kangyang@quicinc.com> writes:

>>>> @@ -5623,6 +5625,9 @@ static int
>>>> ath11k_dp_full_mon_process_rx(struct ath11k_base *ab, int mac_id,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto reap_statu=
s_ring;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>> +=C2=A0=C2=A0=C2=A0 mon_dst_srng =3D &ar->ab->hal.srng_list[dp-
>>>> >rxdma_mon_dst_ring.ring_id];
>>>> +=C2=A0=C2=A0=C2=A0 spin_lock_bh(&mon_dst_srng->lock);
>>>
>>> Why initialise mon_dst_srng differently? The commit message mentions
>>> nothing about this change.
>> Because need to fetch spin lock inside 'struct hal_srng'. If still
>> use 'void *mon_dst_srng', need to perform a variable type cast.
>> Bur 'struct hal_srng' will make this line too long:
>> 'struct hal_srng *mon_dst_srng =3D &ar->ab->hal.srng_list[dp-
>> >rxdma_mon_dst_ring.ring_id];'
>> So I separated the definition and initialization.
>> ath11k_dp_rx_reap_mon_status_ring()/ath11k_dp_process_rx and others
>> ring process function is the same.
>>=20
>
> Do i need to send a new version for this?

Yeah, please mention in the commit message why you mon_dst_srng
initialisation.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

