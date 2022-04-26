Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C7DC4332F
	for <ath11k@archiver.kernel.org>; Tue, 26 Apr 2022 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FClP25BodPse/5xeBpmbb4yKLCFKz3CmP7rejENainA=; b=vxhr0G3xRnL7K5
	0bKUgLhkBtPR/TDlexZOqvJ6E7fnVf1KJr9bHviWHrBv+oAYb3o2bG5G2VKn52IEULXLbhoUdKvUV
	VOryaJPcGZmJZfBiYb8/PEWfIuO0rpidq/arg0YsjaYx36NM3tOseDDruToQcMFtKzVviDN7Ysl+a
	getwYRlRC+Ol8hlDCEpAJdv2ZiG78Lyy436oC7nrsWd3i7FFS4EU5TiVyjC1OuUMqi1uzWYGXzzp4
	6ZXshWXVGbmNkQtMK1t0uRLQekdZ0+8wvLVIEXnmrzMkEZmPdslYBZcc5w5Oodei5mq25jZ+rXCPI
	pOcEYAlA6Gla2tGAstFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njI2R-00DkLT-4Y; Tue, 26 Apr 2022 10:03:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njI2P-00DkJY-AU
 for ath11k@lists.infradead.org; Tue, 26 Apr 2022 10:03:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C002961515;
 Tue, 26 Apr 2022 10:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BFCC385A0;
 Tue, 26 Apr 2022 10:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650967387;
 bh=r3768dlHCT62Q2lOLUs6ZoPdNR4ReDkH5elN6FS+lHE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=rWo2crH4IjZZrAZZZzHE8VrA91/fGW0Czq+aCJbv+AqMNiKTfc82CAKbt6CZyx2qi
 XPgEmXUNGiScreV75xzPcgiGvcpMYrB/xUycS4akzupmQ1tnHZOosuGPXYAL65XL8a
 QCDAwmvYLSn7KtiIuOboNGr7rOZXAm7O0UW9YBjEVSJT/DYvmyOuXa88n0CeFBUNzP
 ctGRUink1xnUE264NPy86cJGgwCbG1mkOxbmWmDixFwAhMmOYlMoD+2t0+hW9Eygu0
 ojrsl1HBrrXX0WeaH4eV/aduZq3zoQjQDbfV5l8Z77O2rRZzQ6DGTd3qdSjvz0acEb
 QslqWM8uV05ZA==
From: Kalle Valo <kvalo@kernel.org>
To: "Hari Chandrakanthan \(QUIC\)" <quic_haric@quicinc.com>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] ath11k: disable spectral scan during spectral deinit
In-Reply-To: <CY4PR02MB32702916194AF1DD0AAD009183FB9@CY4PR02MB3270.namprd02.prod.outlook.com>
 (Hari Chandrakanthan's message of "Tue, 26 Apr 2022 09:55:57 +0000")
References: <1649396345-349-1-git-send-email-quic_haric@quicinc.com>
 <87fsmooz83.fsf@kernel.org> <87levzohyk.fsf@kernel.org>
 <CY4PR02MB32702916194AF1DD0AAD009183FB9@CY4PR02MB3270.namprd02.prod.outlook.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Tue, 26 Apr 2022 13:03:02 +0300
Message-ID: <877d7cjh61.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_030317_438975_2D61ECFD 
X-CRM114-Status: UNSURE (   5.61  )
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

"Hari Chandrakanthan (QUIC)" <quic_haric@quicinc.com> writes:

> Tested-on: QCN6122 hw1.0 AHB WLAN.HK.2.6.0.1-00851-QCAHKSWPL_SILICONZ-1

QCN6122 is not yet supported in upstream, so I guess you are testing
something else than upstream? That's not good.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
