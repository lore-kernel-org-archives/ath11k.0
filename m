Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C5CE7A81
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jfhy78kF2W2F1v0MZi5utBtcKxJhIQxHNYsc0y4V7Zw=; b=ZjPxxUm2q+A9AgRhV1CSzTKP2X
	TO0xl87m55GZqJNyWEMnvkrSSga87mLBl+QRiVAbrOxKkHwArNfRX4hKaUW9FWncWh2b5kjy/fUhH
	RBXMLh5bL7ovrOhUy1/BlYAE+lK0nCHKX2zYJkgoKdyM2UQt9Q9jh8xTkTA6aztXUh75IXcT4LkpD
	QaoKG0f0PKT2WT7R1xLYTv+X6gVr0bl5SRBiRy0NjE/NoL6Yph06D+GmryIcbNjjgUF4yScYDwdzQ
	JdCccfFhz14188z0UENAuMlJN0VsbytZ6Dg5dAIXxTa2hsDSAB6hTAeuC49KlhOnTF7OzNR5AzEF8
	urfYpgVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHDo-00000009RT5-3h6G;
	Thu, 05 Sep 2024 18:28:44 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smHDl-00000009RS9-3tWK
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 18:28:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D04DA44ED3;
	Thu,  5 Sep 2024 18:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6951FC4CEC3;
	Thu,  5 Sep 2024 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725560920;
	bh=f7E3AztuRKMZ28p4LyFuIOxzMggsHH+GtAi8Hcdna/o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=RGjxyBNWFIjT0UV3k85KNMQ/C8AmP1eZPymbVkmmAeHO+w9izHOhUHUbt6IdZjUsX
	 Em7OWJPKgEi0qYauywdcZE5zP1W+HBk0KVfG+kxWfzIu6fQ69oKZryVf0cMduv8MD5
	 /vaAjz7ThafuSkdFPJ+J/c3RCXax/c9OdNPz1N9cDnMmwRYgy1Ni9y1zp85eJxNVGK
	 ocORw5/Vj2GSKuXf3ChkJ4YzMCnezms/KgokuHTEV854SPtDaIwoxqPP28g9iEOwe5
	 h95lzF9t/6XyA65YcxpSX5vVsnyMEHxigBsFVDOzcDkCVQ+226l9MzpcRkXUqtoF2T
	 lYHR2RzLUVGiw==
From: Kalle Valo <kvalo@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Jeff Johnson
 <jjohnson@kernel.org>,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-kernel@vger.kernel.org,  Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the
 inputs of the ath11k on WCN6855
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
	<CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
	<87y146ayrm.fsf@kernel.org>
	<CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
Date: Thu, 05 Sep 2024 21:28:35 +0300
In-Reply-To: <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
	(Bartosz Golaszewski's message of "Thu, 5 Sep 2024 20:19:34 +0200")
Message-ID: <878qw6hs4s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_112842_056772_233B93AF 
X-CRM114-Status: GOOD (  14.77  )
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

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> On Thu, Sep 5, 2024 at 5:47=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrot=
e:
>>
>> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>>
>> >> > +  - if:
>> >> > +      properties:
>> >> > +        compatible:
>> >> > +          contains:
>> >> > +            const: pci17cb,1103
>> >> > +    then:
>> >> > +      required:
>> >> > +        - vddrfacmn-supply
>> >> > +        - vddaon-supply
>> >> > +        - vddwlcx-supply
>> >> > +        - vddwlmx-supply
>> >> > +        - vddrfa0p8-supply
>> >> > +        - vddrfa1p2-supply
>> >> > +        - vddrfa1p8-supply
>> >> > +        - vddpcie0p9-supply
>> >> > +        - vddpcie1p8-supply
>> >>
>> >> Like we discussed before, shouldn't these supplies be optional as not
>> >> all modules need them?
>> >>
>> >
>> > The answer is still the same: the ATH11K inside a WCN6855 does - in
>> > fact - always need them. The fact that the X13s doesn't define them is
>> > bad representation of HW and I'm fixing it in a subsequent DTS patch.
>>
>> But, like we discussed earlier, M.2 boards don't need these so I think
>> this should be optional.
>>
>
> If they are truly dynamic, plug-and-play M.2 boards then they
> shouldn't need any description in device-tree. If they are M.2 sockets
> that use custom, vendor-specific pins (like what is the case on
> sc8280xp-crd and X13s) then the HW they carry needs to be described
> correctly. We've discussed that before.

Sigh. Please reread the previous discussion. In some cases we need to
set qcom,ath11k-calibration-variant even for M.2 boards.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

