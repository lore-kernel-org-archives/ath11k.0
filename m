Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2277F30295
	for <ath11k@archiver.kernel.org>; Mon, 16 Mar 2026 02:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t5G4Irv4dhwRSJ9FVhPVUVdEgWEqIjYl8+gDa27gP0=; b=uNTUyrfatov+cBKZYjFmebWVVf
	3dhVdV3gn9dWSTEz947LRge/f0nCxijXFOtXFv4hLTdEMrso59NC7lxoM7gAbhJQoj1CUBTpKJWCH
	AYPqf0uAveJJ2d9xs66JVnCuEtP5lzNCC1xrXmTaCOoBu2/FIPlpV95rO9z36HRM4sf4leGnBpoEH
	A21shR5FUF8WU8Xs0cl+aFtPeqN536s10S5KZoisomwER+OSADGIYmqmJIocpi1+ryQ5Gy/1G9WS0
	vpzRd87Cc0NFqZdx8XPzLiks4BoGjbnJcWRpv3lPPnlj06LZlCD9kBIvdupW7AGiFCVr0d5NtiLmq
	RwLJ57Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xHo-000000039na-1qyZ;
	Mon, 16 Mar 2026 02:02:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xHn-000000039ms-06O8;
	Mon, 16 Mar 2026 02:02:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2ACF860008;
	Mon, 16 Mar 2026 02:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C2DC2BC9E;
	Mon, 16 Mar 2026 02:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626545;
	bh=kkXUNwiD69Xpf87E5BcMyOtlNTMPeQ7/lEHjHLgRL+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaY9HkVEV6krRsQgLxwkiO7yZMgrlVrPpLXeYQAR7IAx5MDR7TUwQaFz5V5qBSv+A
	 3YoimJldxSYQPdNcTuf1q8DiCAdq3vsH/5xg42nBbHksinhtYNfrYPZega6m4y/sYo
	 dSVfROBNQjnwOQiwv2Iv9yfHYtnCcqA+93lxvlHWuuM58XLuXbmq+J2EL7r6iTqBTr
	 Zn8z8tWJ2xCvEIfT8gIb/4uorPM0rZ/envKWWfSJ/4LQJZFfI5sEgx7a5FPCeNQBPE
	 96u6lp0SEhMsftM3FyXouu+2DSxMYqsHHr06OStUhqnzmBbQFyHf9bdRGjM036xEQk
	 f7OGCBrm7fLPg==
Date: Sun, 15 Mar 2026 21:02:19 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, konradybcio@kernel.org, 
	linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
Message-ID: <abdkE2qWX5Amf5Jo@baldur>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
 <3283cbae-4100-484c-9b00-1d7111c62456@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3283cbae-4100-484c-9b00-1d7111c62456@oss.qualcomm.com>
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

On Tue, Mar 10, 2026 at 01:09:08AM +0100, Daniel Lezcano wrote:
> On 3/10/26 00:50, Jeff Johnson wrote:
> > On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
> > > The different subsystems implementing the QMI service protocol are
> > > using their own definition of the service id. It is not a problem but
> > > it results on having those duplicated with different names but the
> > > same value and without consistency in their name.
> > > 
> > > It makes more sense to unify their names and move the definitions in
> 
> [ ... ]
> 
> > prefix for wireless drivers is simply wifi: <driver>:
> > so s/net: drivers: wireless:/wifi:/
> 
> Noted, thanks
> 
> > >    remoteproc: qcom: Use the unified QMI service ID instead of defining
> > >      it locally
> > >    slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
> > >      defining it locally
> > >    soc: qcom: pdr: Use the unified QMI service ID instead of defining it
> > >      locally
> > >    ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
> > >      defining it locally
> > >    samples: qmi: Use the unified QMI service ID instead of defining it
> > >      locally
> > > 
> > >   drivers/net/ipa/ipa_qmi.c                      |  6 ++----
> > >   drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
> > >   drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
> > >   drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
> > >   drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
> > >   drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
> > >   drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
> > >   drivers/remoteproc/qcom_sysmon.c               |  2 +-
> > >   drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
> > >   drivers/soc/qcom/pdr_interface.c               |  4 ++--
> > >   drivers/soc/qcom/pdr_internal.h                |  3 ---
> > >   drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
> > >   include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
> > >   samples/qmi/qmi_sample_client.c                |  2 +-
> > >   sound/usb/qcom/qc_audio_offload.c              |  2 +-
> > >   sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
> > 
> > You are touching a lot of subsystems with a single series.
> > How do you plan on having these land?
> > Do you have a maintainer who will take all of these through their tree?
> 
> Yes I thought Bjorn or Konrad would take them with the acked-by from the
> different subsystems

As we haven't received any such acks, I pulled patch 1 into an immutable
branch and pushed it here:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com

Other maintainers can use this to pull respective changes, or you can
repost the individual patches with this (or follow up once it's in
-rc1).

Regards,
Bjorn

