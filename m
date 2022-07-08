Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040A9C433EF
	for <ath11k@archiver.kernel.org>; Fri,  8 Jul 2022 06:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68c66eQhvJdSfjc1JXgMAyH5wLm1sv3DdONvhTkbc/4=; b=iOclDdUxGtuOhQ
	Sow9l5Mx7MIDC93eHNuKtFewmqA9mEEcLvpPir0ErANeUwevROm+A1NWWGm75ZfeMYVqUwHkjQpQl
	vFXKlbmhyQ5dCVO/tvu0TZSqqocArYBfj4rs85qne6lLG5lITkgeLHalNoV+eIcTR0A586DybUsIt
	TEfb0S89HWWsDq7ieeYr3G9xewhhu7C2L9PA6zfLM6LCL68WAtyY+sCo5+AokV+PKZWjq4gboMbSo
	7JpF+0ecrqkJ7W1dA+zK3v5xUGbKtpuWnSp7LQHkkHSSzHVXYRG+ZNVnl9cWR3nJVdsE8d1LLALod
	rppdmuVe0Sd1PB7/ct+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hjz-0025ow-OH; Fri, 08 Jul 2022 06:45:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9hju-0025mz-N5; Fri, 08 Jul 2022 06:45:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2B28B824E6;
	Fri,  8 Jul 2022 06:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D42DC341C0;
	Fri,  8 Jul 2022 06:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657262719;
	bh=FlwRiRHtGel2rCGS4TGuYsdGWisqlLhpOiaAc2cCkUU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=I3BnsXq93SQnzAOwRFujOtCiPKruJMc25QSMiggQvZ2wBKS0/v4k5PgqgoNOnr9Qj
	 C5fu9Clucy3N+DXL+4tnrrWWdwaP1jX0xl+iIQ17n0iDsp6huelUwesErmoSLgVU9g
	 +LCFqlQP/PBOEyJEUeyt4Pk2c4MkYDBFhPaZtCfQzFnLRFWBkiCQuHYGqvAXgy3RYF
	 pyWKjiGAQQ56Tqpd3pkZQ2N2W8kGLthplZ68UjeVvWCqOjoW/myrx9a2g5z5ka39tx
	 R8sXHKcHMegDwNKMJtd7q0DXoETrueJo5UA9rt+k5b5i9fv4qmZOkfrXMAy8WlFrj1
	 0t44WfpHnjvDA==
From: Kalle Valo <kvalo@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org,  Ingo Molnar <mingo@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  netdev@vger.kernel.org,  ath11k@lists.infradead.org
Subject: Re: [PATCH 03/13] tracing/ath: Use the new __vstring() helper
References: <20220705224453.120955146@goodmis.org>
	<20220705224749.430339634@goodmis.org>
Date: Fri, 08 Jul 2022 09:45:14 +0300
In-Reply-To: <20220705224749.430339634@goodmis.org> (Steven Rostedt's message
	of "Tue, 05 Jul 2022 18:44:56 -0400")
Message-ID: <87edywt85h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_234522_937689_4BB30DA5 
X-CRM114-Status: GOOD (  11.11  )
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

Steven Rostedt <rostedt@goodmis.org> writes:

> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
>
> Instead of open coding a __dynamic_array() with a fixed length (which
> defeats the purpose of the dynamic array in the first place). Use the new
> __vstring() helper that will use a va_list and only write enough of the
> string into the ring buffer that is needed.
>
> Cc: Kalle Valo <kvalo@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: ath11k@lists.infradead.org
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Feel free to take this via your tree:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
