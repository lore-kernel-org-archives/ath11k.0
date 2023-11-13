Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5BCC05021
	for <ath11k@archiver.kernel.org>; Mon, 13 Nov 2023 14:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEpyBKtIq0ckT1eIb8Dt9mIO5hMIQNvNlWH5nn8nSz8=; b=ASSU6ZGHr1yZCH
	L8Eq8TYcGq+G2gqT5IQupLEykBCX8YeJnpmG2ay/b9w0QdcIfHLzbqrlLNPBjBuOXDFo7cEnPE+tF
	gAhLteu+1r1cjoFkJyncwbyJuBFgKfh6qhBE/kxmnEvzGpEKliXVqoSn8guXoSzahZCmOvJ8P35e5
	+9TXxtwihjSy/7P1k++Aj43i0Yj/3/FHxh/Sn5qQ7k2obpp8zEy1L+rTyADtnuQtANI2byZCQ8WF5
	Z0/71sngNdu9BG7+QsPgtDSlQurR6ymFPs9C/dT190gdlAQF7TvD6TKhxr15S8DhO+mOw2mYqxWjK
	+dOCNgxAGzQne2NukfyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XeY-00E6xc-30;
	Mon, 13 Nov 2023 14:11:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2XeV-00E6xB-2v
	for ath11k@lists.infradead.org;
	Mon, 13 Nov 2023 14:11:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 48047B80DFA;
	Mon, 13 Nov 2023 14:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56B90C433C8;
	Mon, 13 Nov 2023 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699884657;
	bh=2vpy58rQTHTP9krRVNgcAQrv/Q/+avRu6pax/Biruds=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=J3ay90WHC4ALuWZzRA6IAYlybdjApZS9p2RVDXtuXHnkWS7x0DOZEkfn/uXDp1IaA
	 WKiPqVM1DJvqdJejm4ZO6tnPrJqw8ph6QyrtjW28Eq1bIzm31leY/dGKFXYYWHqYBg
	 y4VAgNZtktIzHV0GYWAuc05wxFSClKCWiwIG1puKsf6fT95+mEDV1F8PJLUgOpzpCb
	 B8BJO0bcBD1XK821yKbKpCc1kInm6+ae4p8lWG++1F9rXd4OwuakoWh+YekOWxi9/m
	 a2CnN0GSmBUE+1nNZ1B68QZDp9mnQKs+PnOVIYmYyHH8fjQraIzZIjG4zR0lMfkvN0
	 GjZqHE6whIX9g==
From: Kalle Valo <kvalo@kernel.org>
To: "Luca Weiss" <luca.weiss@fairphone.com>
Cc: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,  "Konrad Dybcio"
 <konrad.dybcio@linaro.org>,  "Andy Gross" <agross@kernel.org>,  "Bjorn
 Andersson" <andersson@kernel.org>,  "Mathieu Poirier"
 <mathieu.poirier@linaro.org>,  "Rob Herring" <robh+dt@kernel.org>,
  "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,  "Conor
 Dooley" <conor+dt@kernel.org>,  "Manivannan Sadhasivam" <mani@kernel.org>,
  <cros-qcom-dts-watchers@chromium.org>,
  <~postmarketos/upstreaming@lists.sr.ht>,  <phone-devel@vger.kernel.org>,
  "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,  "Rob Herring"
 <robh@kernel.org>,  Matti =?utf-8?Q?Lehtim=C3=A4ki?=
 <matti.lehtimaki@gmail.com>,
  <linux-arm-msm@vger.kernel.org>,  <linux-remoteproc@vger.kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,
  <ath11k@lists.infradead.org>
Subject: Re: [PATCH 9/9] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi
References: <20231027-sc7280-remoteprocs-v1-0-05ce95d9315a@fairphone.com>
	<20231027-sc7280-remoteprocs-v1-9-05ce95d9315a@fairphone.com>
	<12ea48bd-5022-4820-815a-89ef23ec9385@linaro.org>
	<CWMK0AQRL87L.1F9MIDVQ4J439@fairphone.com>
	<CAA8EJpqCeW8NVcrpwo6JVn0kE2W-QMELB1YH7i7pgOH6qiPbCQ@mail.gmail.com>
	<87zfzhu9kx.fsf@kernel.org> <CWXP3TCW3A1G.2ME0JJT3S540G@fairphone.com>
Date: Mon, 13 Nov 2023 16:10:51 +0200
In-Reply-To: <CWXP3TCW3A1G.2ME0JJT3S540G@fairphone.com> (Luca Weiss's message
	of "Mon, 13 Nov 2023 13:50:21 +0100")
Message-ID: <87r0ktu4k4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_061100_098515_BF3E3486 
X-CRM114-Status: GOOD (  14.74  )
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

"Luca Weiss" <luca.weiss@fairphone.com> writes:

>> >> > > --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> >> > > +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
>> >> > > @@ -713,3 +713,7 @@ &venus {
>> >> > >     firmware-name = "qcom/qcm6490/fairphone5/venus.mbn";
>> >> > >     status = "okay";
>> >> > >  };
>> >> > > +
>> >> > > +&wifi {
>> >> > > +   status = "okay";
>> >> > qcom,ath11k-calibration-variant?
>> >>
>> >> What value would I put there for my device? Based on existing usages
>> >> (mostly for ath10k) I'd say "Fairphone_5"?
>> >
>> > I think this is fine.
>>
>> From style point of view I would prefer lower case and dashes, for
>> example "fairphone-5" but I'm just nitpicking, uppercase and underscores
>> work fine as well.
>
> I really don't mind, but I used "Fairphone_5" in v2 now, but I can
> change it for v3 if that happens if you wish.

Nah, no need to resend. That's fine.

But in the future please try to CC the ath11k list for patches like
this, easier to follow what's happening.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
