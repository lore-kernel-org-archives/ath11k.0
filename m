Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B887C77B7C
	for <ath11k@archiver.kernel.org>; Sun, 21 May 2023 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pLzxk3aVlfuZNpuOphdUf9cAc2vYBiDCYHZAN8wwvUM=; b=aYhdhOmwXZAD60
	LncAaXp2ZwkqIfLXp7oaFUxbYWbM6onfgR3NqLenmyne/mAYcqkG5OUxPYFBwRGHyGZOkwAClZQwb
	d9FGEnc0bwZ7CFH2PsP231tQt6N4tGNUsQx6u6OgrKcI2gx3TtusHI4jvbpLF7stYtKQHPwbk0O0P
	9Q7nNq3ykmtvmsQSsR2cdpb4R3ufgC6aUiTqIy68CXtE88c1H9x8N/wL6aoPEul5Fu4j2x9I8LJ5d
	m3U2+l3MIu80nlfCu+sRPUkRoBZdQLWc8fZhRdAA2Y/74xUkwe5XRsbQZqm8V5Ct29eM1Jja8t1zU
	9vt3xh+8AbVz6Ask0zrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0oHq-004Rep-1S;
	Sun, 21 May 2023 19:00:10 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0nB3-004IDG-2x
	for ath11k@lists.infradead.org;
	Sun, 21 May 2023 17:49:07 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ba841216e92so7534026276.1
        for <ath11k@lists.infradead.org>; Sun, 21 May 2023 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684691343; x=1687283343;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HA5i5d/MKnlZtzhCD2oMZslei4xU+OAXwtdVXosID+k=;
        b=KsHJq9IMlQxSn1ymymDeONWRIBQ9QbDA+Vo5XChJkLsc/JeR0m+9onAFQopkmaRU8t
         UwAxopzCuCp6G4CBDWhbxNOtxib28QT2C/Gkj7ageBjZQAfFdH3TK2P/lDYiRqYmJlI2
         EoeX7ZbEXnTN9N+dDfnxvfctzgir/hIZEBBraYg+iVfleOMU59U9NHZeNT2+O5tRFSPG
         DGVk9Oo6JOJdnCPsmkb6rUw5IUyySqAth59rpsSDZKLdz9Yo2eyVPIhhEoQQuIk3md3o
         8Ul18TO9wcppcKna1BP5MU/OWqPd6WuAQVeuuOWHphmTPAb0TnJIppoI7KFmHLE2urOM
         HkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684691343; x=1687283343;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HA5i5d/MKnlZtzhCD2oMZslei4xU+OAXwtdVXosID+k=;
        b=HHLqNDq4RVDm6CAtCVFF9pmbytqbKBgKprYMAXUhMpKsBYT2L1YboTNp+ZMC5Np2hR
         Hjln7vM1KlSyrXVcm+5MKeACKt+PgFTR3qkcxrYtb8OHr1NzUkPo4w+dYVMMzkL/foGE
         BiiIwuMMz7CJWJ1vSmnL3LqzU4sQ7nLvUR49gY2EHVp+IKodJTbLrkCVAlE1YZtEUbeI
         ki2//8OJ4xWQIGt67NdJn7Yjp1yaJX3gfimv+HiTqRu4D6Kh6WBk+RMQ6bh/6AuiDzvo
         brp5bVnZmRWAM9CMuuUKUcXdg9Dd9VKMQl7Tqw9jANDsYpa8OIUWMpYTH7YmkPdpTbVf
         seQw==
X-Gm-Message-State: AC+VfDyTfk9oe+lDvyHJ+4rI3Jdv2oO9w6F84j8g2ddi7lC6YKMrSdJK
	hpLrOixHTcvQ/Re55hfrzafTmffrFJ/QxYiQUyU=
X-Google-Smtp-Source: ACHHUZ4vcfMyrkgGbEHgDaQ10EfDI+cPB7yCHp/bqpiX/PQH3ZIp0cLjwBYevD29UC76dHgsg09G0ag/APneTi4aBT0=
X-Received: by 2002:a25:71d4:0:b0:ba8:3a86:15ca with SMTP id
 m203-20020a2571d4000000b00ba83a8615camr8005285ybc.60.1684691343083; Sun, 21
 May 2023 10:49:03 -0700 (PDT)
MIME-Version: 1.0
From: Tyler Stachecki <stachecki.tyler@gmail.com>
Date: Sun, 21 May 2023 13:51:33 -0400
Message-ID: <CAC6wqPVvke=Gy59yvYcaps2dwVzO=wfwdSTGNxFzAOWc5OpoDw@mail.gmail.com>
Subject: Re: [PATCH v3] wifi: ath11k: Add rx histogram stats
To: quic_mkenna@quicinc.com
Cc: "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, 
	"open list:NETWORKING DRIVERS (WIRELESS)" <linux-wireless@vger.kernel.org>, quic_akalaise@quicinc.com, 
	quic_mpubbise@quicinc.com
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_104905_976127_2E8CFFF0 
X-CRM114-Status: GOOD (  10.25  )
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

Was this really tested on QCN9074 as the commit text suggests...?

> const struct ath11k_hw_ops ipq6018_ops = {
> @@ -1132,6 +1147,7 @@ const struct ath11k_hw_ops wcn6750_ops = {
>  .rx_desc_get_msdu_payload = ath11k_hw_qcn9074_rx_desc_get_msdu_payload,
>  .reo_setup = ath11k_hw_wcn6855_reo_setup,
>  .mpdu_info_get_peerid = ath11k_hw_ipq8074_mpdu_info_get_peerid,
> + .mpdu_info_get_mpdu_len = ath11k_hw_qcn9074_mpdu_info_get_mpdu_len,

...

> +static u32 ath11k_hal_rx_mpduinfo_get_mpdu_len(struct ath11k_base *ab,
> +       struct hal_rx_mpdu_info *mpdu_info)
> +{
> + return ab->hw_params.hw_ops->mpdu_info_get_mpdu_len(mpdu_info);
> +}

I think you want to put this under qcn9074_ops. As of now, when
QCN9074 is present, it attempts to jump to a NULL pointer as
mpdu_info_get_mpdu_len remains uninitialized for qcn9074_ops.

And, do you not need to define mpdu_info_get_mpdu_len for all the
other hw_ops? If so, please be careful about defining it for
WCN6855/WCN6750 as there was a recent regression due to how the RX
MPDU info is provided by those firmwares as it differed from
IPQ8074/QCN9074. I personally do not have the appropriate literature
to determine whether or not this is consequential or not here as well,
though it seems like it would be:
https://lore.kernel.org/linux-wireless/20230404072234.18503-3-quic_youghand@quicinc.com/

Tyler

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
