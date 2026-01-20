Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C1ED2ECF7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jan 2026 06:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1zVpj9IsnuM0bk4jSFrQkBRULk/cZDI0jQfItOtmuo=; b=VJFmC5yBlY1/QyEF6qXV84WsTf
	Xxa1VSjjvv9hC+9i/UnQfPhlVk4O50Kl1SYAnICM4bYbqmyQhkOgE3ZakYdV6upnlyIOxfaP7ATC1
	gK1E60p7qHzhFYuWfZnR+ssJZJYjU6NkmzT4tIVZ6Tj0eg/RVxG7LLXZn2456ywaMnPYbRWCUsuVX
	5Kk0KxYP8D0JOdmbFDwT6By+Gw+AMvpKwsEHojLHMYPXjDTFpTnymAu7nR5ihD/GgU9v4c6EFl+Us
	evvW2NvqI6nxvihtO/dLjBdImQXnTa0vhylLYvP2kgByPlzNASNfey3+rieJOQRqycOCccvDPbblJ
	X1J8CI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4nL-00000003FBD-2akG;
	Tue, 20 Jan 2026 06:00:51 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi4nI-00000003FAu-0xCz
	for ath11k@lists.infradead.org;
	Tue, 20 Jan 2026 06:00:50 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3141cf57d;
	Tue, 20 Jan 2026 13:55:40 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	jianhao.xu@seu.edu.cn,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH] wifi: ath11k: fix memory leaks in beacon template setup
Date: Tue, 20 Jan 2026 05:55:38 +0000
Message-Id: <20260120055538.2355920-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <55fad8d1-ab4f-48b8-8712-24664a6bab2c@oss.qualcomm.com>
References: <55fad8d1-ab4f-48b8-8712-24664a6bab2c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bd9f91c0303a1kunmb9fdaa681f5558
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGRpIVkhCS0sYSkseT0JPHlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0NVSktLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=BkfsUwfNtqwDiPfF0hpUYvGViw3aAOLXb76GmGlUQqdqIwrz3DZQQwywUrTWzxhXk07L/vXahh8rq+6Z6HDvmLHt2EH3QWoC8O/IHvK0MoxxR/VrnlrMPheL00twvA7GgclQjrbFg+1xfDOr6oqiQKJgdVTWAgPpjVvqFYYzJQY=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=n1zVpj9IsnuM0bk4jSFrQkBRULk/cZDI0jQfItOtmuo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_220048_951286_4B57A2F9 
X-CRM114-Status: UNSURE (   8.86  )
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

On Tue, Jan 20, 2026 at 10:52:54AM +0800, Baochen Qiang wrote:
> below would be better?
> 
> @@ -1622,19 +1622,21 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif,
>         }
> 
>         if (tx_arvif == arvif) {
> -               if (ath11k_mac_set_vif_params(tx_arvif, bcn))
> -                       return -EINVAL;
> +               if (ath11k_mac_set_vif_params(tx_arvif, bcn)) {
> +                       ret = -EINVAL;
> +                       goto free;
> +               }
>         } else if (!ath11k_mac_set_nontx_vif_params(tx_arvif, arvif, bcn)) {
> -               return -EINVAL;
> +               ret = -EINVAL;
> +               goto free;
>         }
> 
>         ret = ath11k_wmi_bcn_tmpl(ar, arvif->vdev_id, &offs, bcn, 0);
> -       kfree_skb(bcn);
> -
>         if (ret)
>                 ath11k_warn(ab, "failed to submit beacon template command: %d\n",
>                             ret);
> -
> +free:
> +       kfree_skb(bcn);
>         return ret;
>  }
> 
> >  static int ath11k_mac_setup_bcn_tmpl(struct ath11k_vif *arvif)

Thanks for your suggestion. I will send a v2 to change it.

Regards,
Zilin Guan

